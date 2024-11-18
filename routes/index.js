var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET all personality test results */
router.get("/results", (req, res) => {
  const results = [
    { title: "Front-End Developer", description: "Focuses on the user interface and user experience of web applications. They work with HTML, CSS, JavaScript, and frameworks like React or Angular." },
    { title: "Back-End Developer", description: "Works on the server side, handling the logic, database interactions, and server configuration. They often use languages like Python, Java, Ruby, or Node.js." },
    { title: "Full-Stack Developer", description: "Handles both front-end and back-end development. They have a broad skill set that allows them to build complete applications from start to finish." },
    { title: "DevOps Engineer", description: "Focuses on the integration of development and operations. They work on automating deployment, monitoring systems, and managing infrastructure using tools like Docker, Kubernetes, and CI/CD pipelines." },
    { title: "Database Administrator", description: "Specializes in managing and optimizing databases. They ensure data integrity, performance, and security, and work with databases like MySQL, PostgreSQL, or MongoDB." },
    { title: "Game Developer", description: "Game developers are responsible for creating and producing video games for various platforms, including consoles, PCs, and mobile devices. Their work involves designing, programming, testing, and refining games to provide an engaging user experience." },
  ];

  res.json(results);
});

/* GET all questions */
router.get("/api/question", async (req, res) => {
  const questions = await req.db.from("questions").select("question_text");
  res.json({ questions });
});

/* GET all answers based on question ID */
router.get("/api/answer/:questionId", async (req, res) => {
  const answers = await req.db.from("answers").select("letter_of_choice", "answer_text").where("question_id", "=", req.params.questionId);
  res.json({ answers });
});

const getQuestionCount = async (req) => {
  const question_count = await req.db.from("questions").count("*");
  return question_count[0]["count(*)"];
}

router.post("/result/calculate", async (req, res) => {
  const { answers } = req.body;
  console.log(answers);

  const question_count = await getQuestionCount(req);
  console.log(question_count);

  const scores = { FED: 0, BED: 0, FSD: 0, DOE: 0, DBA: 0, GDV: 0 };

  /*

  FOR REFERENCE: 

  FED = Front-End Developer
  BED = Back-End Developer
  FSD = Full-Stack Developer
  DOE = DevOps Engineer
  DBA = Database Administrator
  GDV = Game Developer

  TODO: 
  Update README 
  Finish all routes 

  */

  for (let i = 0; i < question_count; ++i) {
    const score_query = await req.db.from("answers")
      .select("score_fed", "score_bed", "score_fsd", "score_doe", "score_dba", "score_gdv")
      .where("question_id", "=", i + 1).andWhere("letter_of_choice", "=", answers[i]);


    scores.FED += score_query[0].score_fed; 
    scores.BED += score_query[0].score_bed; 
    scores.FSD += score_query[0].score_fsd; 
    scores.DOE += score_query[0].score_doe; 
    scores.DBA += score_query[0].score_dba; 
    scores.GDV += score_query[0].score_gdv; 
  }

  console.log(scores); 

  let result = "FED"; 
  let max = 0; 

  for (const [key, value] of Object.entries(scores)) {
    //console.log(key, value);
    if(max < value)
    {
      result = key; 
      max = value; 
    }
  }

  console.log(result); 
  return result; 
});

module.exports = router;