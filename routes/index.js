var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' });
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

  const scores = { FED: 0, BED: 0, FSD: 0, DOE: 0, DBA: 0, GDV: 0, QAT: 0, MAD: 0, CSX: 0, BCD: 0 };

  /*

  FOR REFERENCE: 

  FED = Front-End Developer
  BED = Back-End Developer
  FSD = Full-Stack Developer
  DOE = DevOps Engineer
  DBA = Database Administrator
  GDV = Game Developer
  QAT = QA Tester / Quality Assurance Tester
  MAD = Mobile App Developer
  CSX = Cyber Security Expert
  BCD = Blockchain Developer

  TODO: 
  Update README 
  Finish all routes 

  */

  for (let i = 0; i < question_count; ++i) {
    if (answers[i] === "") {
      return res.json({
        error: true,
        message: `You did not answer question ${i + 1}.`,
      });
    }

    const score_query = await req.db.from("scores")
      .join("answers", "answers.answer_id", "=", "scores.answer_id")
      .select("scores.career_code", "scores.score")
      .where("answers.question_id", "=", i + 1)
      .andWhere("answers.letter_of_choice", "=", answers[i]);

    console.log(score_query);

    score_query.forEach((sq) => {
      scores[sq.career_code] += sq.score;
    });
  }

  console.log(scores);

  let result = "FED";
  let max = 0;

  for (const [key, value] of Object.entries(scores)) {
    //console.log(key, value);
    if (max < value) {
      result = key;
      max = value;
    }
  }

  res.json({ result });
});

router.get("/api/careers", async (req, res) => {
  const careers = await req.db.from("careers")
    .select("career_name", "personality_description");

  res.json({ careers });
});

router.get("/api/career/:careerCode", async (req, res) => {
  const result_query = await req.db.from("careers")
    .select("*")
    .where("career_code", "=", req.params.careerCode);

  res.json(result_query[0]);
});

module.exports = router;