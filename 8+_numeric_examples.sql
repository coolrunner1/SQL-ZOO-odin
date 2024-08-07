#1. Show the the percentage who STRONGLY AGREE

SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

#2. Show the institution and subject where the score is at least 100 for question 15.

SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score>=100

#3. Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15' 

SELECT institution, score
  FROM nss
 WHERE question='Q15'
   AND score<50
   AND subject='(8) Computer Science'

#4. Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'. 

SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject

#5. Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.

SELECT subject, SUM(response*A_STRONGLY_AGREE/100)
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject

#6. Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'. 

SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response))
  FROM nss
 WHERE question='Q22'
   AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject

#7. Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name. 

SELECT institution, ROUND(SUM(score * response) / SUM(response)) score
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution

#8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. 

SELECT institution, SUM(sample), SUM(CASE
    WHEN subject = '(8) Computer Science' THEN sample
    ELSE 0
 END) comp
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
GROUP BY institution