var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
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

/* GET all questions */ 
router.get("/api/question", async (req, res) => {
  const questions = await req.db.from("questions").select("question_text");
  res.json({questions});
});

/* GET all answers based on question ID */ 
router.get("/api/answer/:questionId", async (req, res) => {
  const answers = await req.db.from("answers").select("answer_text").where("question_id", "=", req.params.questionId);
  res.json({answers});
});

module.exports = router;