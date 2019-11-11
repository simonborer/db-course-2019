---
title: "Week 6 - Midterm Review; Live Application"
date: 2019-10-14T08:47:11+01:00
publishdate: 2019-11-02T08:47:11+01:00
featured_image: space-time.jpg
summary: "This week we'll review the midterm, and work with date/time data; various data types used in MySQL."
---
<section class="slide-only">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Happy Monday!</h2>
    </div>
  </div>
</section>
<section>
    <div class="grid-x">
      <div class="cell large-10 large-offset-1">
        <ol class="toc">
          <h2 class="slide-only">Here's what we're going to do today:</h2>
          <li><a href="#midtermReview">Midterm Review</a></li>
          <li><a href="#datetime">Date/time deep dive</a></li>
          <li><a href="#lab">Lab</a></li>
        </ol>
      </div>
    </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Congratulations!</h2>
      <p>You all did better than I expected on the exam.</p>
      <p>If you haven't gotten your marks yet, I can at least tell you this:</p>
      <p><strong>Nobody failed!</strong></p>
      <img src="/images/celebration.jpg" alt="Celebrating with confetti" style="max-height:35vh">
    </div>
  </div>
</section>

<section id="midtermReview">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Midterm review</h2>
      <blockquote>01. Return a column called “Seniority” that shows how long it has been since a teacher was hired, and order it starting with the most seniority (the teacher with their hire date furthest in the past).</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT 
  teacher_id, 
  DATEDIFF(CURRENT_DATE(), hire_date) AS Seniority 
FROM teachers
ORDER BY Seniority DESC
-- OR 
SELECT hire_date AS Seniority FROM teachers
ORDER BY hire_date </code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="340" cols="50" class="post-only">SELECT 
  teacher_id, 
  DATEDIFF(CURRENT_DATE(), hire_date) 
    AS Seniority 
FROM teachers
ORDER BY Seniority DESC

-- OR 

SELECT hire_date AS Seniority FROM teachers
ORDER BY hire_date </textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><p>Started off with kind of a hard one!</p><p>I <em>did</em> give marks if you just used `ORDER BY`, but you had to do it <em>in the right order.</em></p></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>02. Find all the students with a last name starting with the letters A through E.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM students
WHERE last_name <= 'E'
-- OR 
SELECT * FROM students
WHERE SUBSTR(last_name, 1, 1) BETWEEN 'A' AND 'E'</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="250" cols="50" class="post-only">SELECT * FROM students
WHERE last_name <= 'E'

-- OR 

SELECT * FROM students
WHERE SUBSTR(last_name, 1, 1) 
  BETWEEN 'A' AND 'E'</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">Congrats to those of you who did this the easy way, and remembered that we can use the greater than and less than operators on letters!</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>03. Return a column called “Teacher Full Name” that combines their last and first names, separated by a comma.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT CONCAT(last_name, ', ', first_name) 
  AS "Teacher Full Name"
FROM teachers</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="100" cols="50" class="post-only">SELECT CONCAT(last_name, ', ', first_name) 
  AS "Teacher Full Name"
FROM teachers</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>04. Find all the students with a first name beginning with the letters A, C or E.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM students
WHERE SUBSTR(first_name, 1, 1) IN ('A', 'C', 'E')
-- OR 
SELECT * FROM students 
WHERE first_name LIKE 'A%'
OR first_name LIKE 'C%'
OR first_name LIKE 'E%'</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="280" cols="50" class="post-only">SELECT * FROM students
WHERE SUBSTR(first_name, 1, 1) IN ('A', 'C', 'E')

-- OR 

SELECT * FROM students 
WHERE first_name LIKE 'A%'
OR first_name LIKE 'C%'
OR first_name LIKE 'E%'</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">Using `IN` with a list makes for a lot less code.</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>05. Find all the students with a student id above 222.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM students
WHERE student_id > 222</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT * FROM students
WHERE student_id > 222</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>06. Write a query that returns any students with a hyphen in their last name.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM students
WHERE last_name LIKE '%-%'</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT * FROM students
WHERE last_name LIKE '%-%'</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>07. Let’s say that teachers must pay a special parking fee of $250 per year. Write a query that returns each teacher’s first name, last name and their salary with $250 taken off.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT first_name, last_name, salary - 250 
FROM teachers</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT first_name, last_name, salary - 250 
FROM teachers</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>08. Return a list of the top 5 highest paid teachers and their salary to the nearest dollar.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT first_name, last_name, ROUND(salary) 
FROM teachers
ORDER BY salary DESC
LIMIT 5</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT first_name, last_name, ROUND(salary) 
FROM teachers
ORDER BY salary DESC
LIMIT 5</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>I don't know where so many people picked up this syntax for `LIMIT`:</p>
        <pre class="slide-only"><code class="language-sql">SELECT * FROM teachers
LIMIT 5,1</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">SELECT * FROM teachers
LIMIT 5, 1</textarea>
      <p>...but it <em>does</em> work. Just not the way many of you thought it did.</p>
      <p>The second value is offset, meaning it skips the first result!</p>
</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>09. Ronan (student_id 231, student_number 94578) is asking about their registered courses. Print out a list of classes this student is enrolled in.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT class_name FROM enrollment e 
JOIN classes c
ON e.class_id = c.class_id 
WHERE student_id = 231</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT class_name FROM enrollment e 
JOIN classes c
ON e.class_id = c.class_id 
WHERE student_id = 231</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">I saw a lot of people joining more tables than they needed to.</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>10. Print a list of every class which has a teacher assigned to it. Include the teacher’s name.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT class_name, last_name, first_name 
FROM classes c JOIN teachers t
ON c.teacher_id = t.teacher_id</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="100" cols="50" class="post-only">SELECT class_name, last_name, first_name 
FROM classes c JOIN teachers t
ON c.teacher_id = t.teacher_id</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>11. Print out a list of classes in the fall 2019 semester. The fall semester starts in September 2019 and ends in December 2019.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM classes
WHERE start_date BETWEEN '2019-09-01' AND '2019-09-31'
AND finish_date BETWEEN '2019-12-01' AND '2019-12-31'</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="160" cols="50" class="post-only">SELECT * FROM classes
WHERE start_date 
  BETWEEN '2019-09-01' AND '2019-09-31'
AND finish_date 
  BETWEEN '2019-12-01' AND '2019-12-31'</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">I saw many people struggling with dates. You were definitely creative in your problem solving. But we're going to do some date review today.</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>12. Find classes not in the web program. Note: the web program classes are all prefixed with ‘HTTP’.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM classes
WHERE class_code NOT LIKE 'HTTP%'</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT * FROM classes
WHERE class_code NOT LIKE 'HTTP%'</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>13. Find students who enrolled in August. Order by their last name, then by their first name.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM students
WHERE MONTH(enrollment_date) = 8
ORDER BY last_name, first_name

-- OR

SELECT * FROM students
WHERE enrollment_date 
  BETWEEN '2019-08-01' AND '2019-08-31'
ORDER BY last_name, first_name</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="310" cols="50" class="post-only">SELECT * FROM students
WHERE MONTH(enrollment_date) = 8
ORDER BY last_name, first_name

-- OR

SELECT * FROM students
WHERE enrollment_date 
  BETWEEN '2019-08-01' AND '2019-08-31'
ORDER BY last_name, first_name</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>14. Find the average teacher’s salary.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT AVG(salary) FROM teachers</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">SELECT AVG(salary) FROM teachers</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>15. Write a query that returns the first teacher that was hired.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT MIN(hire_date) FROM teachers

-- OR

SELECT first_name, last_name FROM teachers
ORDER BY hire_date 
LIMIT 1</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="220" cols="50" class="post-only">SELECT MIN(hire_date) FROM teachers

-- OR

SELECT first_name, last_name FROM teachers
ORDER BY hire_date 
LIMIT 1</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>16. Miriam Delgado (teacher_id 134) teaches “Web Application Development 2”  (class_id 23) in the winter semester. She needs an attendance sheet organized by students’ last name, then by the students’ first name. Print out a list of students who are registered in this class, including their student number. Hint: Use the bridging table to find students enrolled in classes.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT last_name, first_name
FROM enrollment e JOIN students s
ON e.student_id = s.student_id
WHERE class_id = 23
ORDER BY last_name, first_name</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="160" cols="50" class="post-only">SELECT last_name, first_name
FROM enrollment e JOIN students s
ON e.student_id = s.student_id
WHERE class_id = 23
ORDER BY last_name, first_name</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>17. Write a query that returns teachers with no classes. </blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM teachers t LEFT JOIN classes c
ON t.teacher_id = c.teacher_id
WHERE class_id IS NULL</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT * FROM teachers t 
  LEFT JOIN classes c
ON t.teacher_id = c.teacher_id
WHERE class_id IS NULL</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">I saw a lot of people getting the self join syntax confused with the syntax for outer joins. <p>Outer joins are common. Self joins are rare.</p></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>18. Write a query that returns classes with no students. </blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM classes c 
  LEFT JOIN enrollment e 
  ON c.class_id = e.class_id
WHERE e.enrollment_id IS NULL</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT * FROM classes c 
  LEFT JOIN enrollment e 
  ON c.class_id = e.class_id
WHERE e.enrollment_id IS NULL</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>19. Write a query that returns students with less than 5 classes. </blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT student_id, COUNT(*) FROM enrollment
GROUP BY student_id
HAVING COUNT(*) < 5

-- BUT ACTUALLY

SELECT student_id, COUNT(DISTINCT class_id) 
FROM enrollment
GROUP BY student_id
HAVING COUNT(DISTINCT class_id) < 5</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="310" cols="50" class="post-only">SELECT student_id, COUNT(*) FROM enrollment
GROUP BY student_id
HAVING COUNT(*) < 5

-- BUT ACTUALLY

SELECT student_id, COUNT(DISTINCT class_id) 
FROM enrollment
GROUP BY student_id
HAVING COUNT(DISTINCT class_id) < 5</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">As you saw in the lettered questions, there were some duplicate records in the enrollment table. <p>I fully admit, I did not do that on purpose.</p><p>That being said, it showcases the importance of the `DISTINCT` clause.</p></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>20. Print out a list that reads “x teaches y classes”, where x is the teacher’s name, and y is the number of classes they teach. Include the teachers that teach 0 classes. </blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT CONCAT(first_name,' ',last_name,' teaches ', 
  COALESCE(COUNT(class_id), 0),' classes')
FROM teachers t LEFT JOIN classes c
ON c.teacher_id = t.teacher_id
GROUP BY t.teacher_id

-- OR

SELECT CONCAT(first_name,' ',last_name,' teaches ', 
  COALESCE((SELECT COUNT(*) 
    FROM classes c WHERE c.teacher_id = t.teacher_id), 0), 
  ' classes') 
FROM teachers t</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="700" cols="50" class="post-only">SELECT CONCAT(
  first_name, 
  ' ', 
  last_name, 
  ' teaches ', 
  COALESCE(COUNT(class_id), 0), 
  ' classes')
FROM teachers t LEFT JOIN classes c
ON c.teacher_id = t.teacher_id
GROUP BY t.teacher_id

-- OR

SELECT CONCAT(
  first_name, 
  ' ', 
  last_name, 
  ' teaches ', 
  COALESCE((
    SELECT COUNT(*) FROM classes c 
      WHERE c.teacher_id = t.teacher_id), 0), 
  ' classes') 
FROM teachers t</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>21. Modify the above query so that the printed string include “this semester” and only select classes which are this semester. This semester begins in September and ends in December.</blockquote>
      <pre class="slide-only"><code class="language-sql">SELECT CONCAT(first_name, ' ', last_name, ' teaches ', 
  COUNT(class_id), ' classes this semester')
FROM classes c JOIN teachers t
ON c.teacher_id = t.teacher_id
GROUP BY c.teacher_id, start_date, finish_date
HAVING MONTH(start_date) = 9 
  AND YEAR(start_date) = YEAR(NOW())
  AND MONTH(finish_date) = 12 
  AND YEAR(finish_date) = YEAR(NOW())</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="430" cols="50" class="post-only">SELECT CONCAT(
  first_name, 
  ' ', 
  last_name, 
  ' teaches ', 
  COALESCE(COUNT(class_id), 0), 
  ' classes')
FROM teachers t LEFT JOIN classes c
ON c.teacher_id = t.teacher_id
GROUP BY c.teacher_id, start_date, finish_date
HAVING MONTH(start_date) = 9 
AND YEAR(start_date) = YEAR(NOW())
AND MONTH(finish_date) = 12 
AND YEAR(finish_date) = YEAR(NOW())</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>21. cont'd</blockquote>
      <pre class="slide-only"><code class="language-sql">-- OR 

SELECT CONCAT(first_name, ' ', last_name, ' teaches ',
  COUNT(class_id), ' classes this semester')
FROM classes c JOIN teachers t
ON c.teacher_id = t.teacher_id
WHERE start_date BETWEEN '2019-09-01' AND '2019-09-31'
AND finish_date BETWEEN '2019-12-01' AND '2019-12-31'
GROUP BY c.teacher_id</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="370" cols="50" class="post-only">-- OR 

SELECT CONCAT(first_name, ' ', last_name, 
  ' teaches ',
  COUNT(class_id), ' classes this semester')
FROM classes c JOIN teachers t
ON c.teacher_id = t.teacher_id
WHERE start_date 
  BETWEEN '2019-09-01' AND '2019-09-31'
AND finish_date 
  BETWEEN '2019-12-01' AND '2019-12-31'
GROUP BY c.teacher_id</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>22. Add yourself to the students table. Use your student number and name. </blockquote>
      <pre class="slide-only"><code class="language-sql">INSERT INTO students 
  VALUES(NULL, 'my', 'name', 12345, '2020-10-31')</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">INSERT INTO students 
  VALUES(
    NULL, 'my', 'name', 12345, '2020-10-31'
  )</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><p>Getting into the CRUD questions, we need to clear something up:</p>
    <p><code class="language-sql">UPDATE</code> changes a value in a row (or rows).</p>
    <p><code class="language-sql">INSERT</code> adds a new row.</p>
    <p><code class="language-sql">ALTER</code> changes the table structure.</p>
    <p><code class="language-sql">DELETE</code> gets rid of a row (or rows).</p>
    <p><code class="language-sql">DROP</code> removes a column, table or database.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>23. Put yourself into 3 classes that are offered next semester.</blockquote>
      <pre class="slide-only"><code class="language-sql">INSERT INTO enrollment VALUES (NULL, 240, 22);
INSERT INTO enrollment VALUES (NULL, 240, 23);
INSERT INTO enrollment VALUES (NULL, 240, 27);</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="190" cols="50" class="post-only">INSERT INTO enrollment 
  VALUES (NULL, 240, 22);
INSERT INTO enrollment 
  VALUES (NULL, 240, 23);
INSERT INTO enrollment 
  VALUES (NULL, 240, 27);</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">I didn't see many people using `NULL` as their value in the `AUTO-INCREMENT`'d primary key column. I didn't take off marks, but it does make life easier!</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>24. Change your record. Make your student number the first five characters of your original student number.</blockquote>
      <pre class="slide-only"><code class="language-sql">UPDATE students SET student_number = '54321'
WHERE student_id = 240</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="100" cols="50" class="post-only">UPDATE students 
SET student_number = '54321'
WHERE student_id = 240</textarea></p>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <blockquote>25. Write a query that will drop you out of any courses with the word ‘web’ in the class name.</blockquote>
      <pre class="slide-only"><code class="language-sql">DELETE e FROM enrollment e 
  JOIN classes c 
  ON e.class_id = c.class_id
WHERE student_id = 240 
  AND UPPER(class_name) LIKE '%WEB%' </code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="160" cols="50" class="post-only">DELETE e FROM enrollment e 
  JOIN classes c 
  ON e.class_id = c.class_id
WHERE student_id = 240 
  AND UPPER(class_name) LIKE '%WEB%' </textarea></p>
      </div>
  </div>
</section>
<section id="datetime">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Date/time deep dive</h2>
      <img src="/images/temple_fugate.jpg" alt="Temple Fugate, a.k.a. the Clock King" style="margin-bottom: 1rem;max-height: 50vh;">
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <code>DATE</code>, <code>TIME</code>, and <code>DATETIME</code> are the trickiest data types.
      <p>Let's start here:</p>
      <pre class="slide-only"><code class="language-sql">SELECT NOW() FROM dual
-- Returns something like 
-- 2019-11-03 21:10:11.0</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="100" cols="50" class="post-only">SELECT NOW() FROM dual
-- Returns something like 
-- 2019-11-03 21:10:11.0</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <pre class="slide-only"><code class="language-sql">SELECT YEAR(NOW()) FROM dual;
-- Returns 2019
SELECT MONTH(NOW()) FROM dual;
SELECT WEEK(NOW()) FROM dual;
SELECT DAY(NOW()) FROM dual;
SELECT HOUR(NOW()) FROM dual;
SELECT MINUTE(NOW()) FROM dual;
SELECT SECOND(NOW()) FROM dual;</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="250" cols="50" class="post-only">SELECT YEAR(NOW()) FROM dual;
-- Returns 2019
SELECT MONTH(NOW()) FROM dual;
SELECT WEEK(NOW()) FROM dual;
SELECT DAY(NOW()) FROM dual;
SELECT HOUR(NOW()) FROM dual;
SELECT MINUTE(NOW()) FROM dual;
SELECT SECOND(NOW()) FROM dual;</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <pre class="slide-only"><code class="language-sql">-- EXTRACT([UNIT] FROM [value])
SELECT SECOND(NOW()) FROM dual
-- ...is the same as...
SELECT EXTRACT(SECOND FROM NOW()) FROM dual</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">-- EXTRACT([UNIT] FROM [value]) 
SELECT SECOND(NOW()) FROM dual
-- ...is the same as...
SELECT EXTRACT(SECOND FROM NOW()) FROM dual</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>The one thing that `EXTRACT` can do that the others functions can't is extract multiple units.</p>
      <pre class="slide-only"><code class="language-sql">SELECT EXTRACT(YEAR_MONTH FROM NOW()) FROM dual;</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT EXTRACT(YEAR_MONTH FROM NOW()) 
FROM dual;
</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Get the current date or time</p>
      <pre class="slide-only"><code class="language-sql">SELECT DATE(NOW()) FROM dual;
-- ...is the same as...
SELECT CURRENT_DATE() FROM dual;

SELECT TIME(NOW()) FROM dual;
-- ...is the same as...
SELECT CURRENT_TIME() FROM dual;</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="220" cols="50" class="post-only">SELECT DATE(NOW()) FROM dual;
-- ...is the same as...
SELECT CURRENT_DATE() FROM dual;

SELECT TIME(NOW()) FROM dual;
-- ...is the same as...
SELECT CURRENT_TIME() FROM dual;</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Formatting dates</h2>
      <p>There are an <a href="https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format" target="_blank">intense number of options for formatting dates.</a></p>
      <p>The default MySQL format would be represented as<br><code>%Y-%m-%d %H:%i:%s</code>.</p>
      <p>We can change the format (both the order and types) using the <code>DATE_FORMAT</code> function.</p>
      <pre class="slide-only"><code class="language-sql">SELECT DATE_FORMAT(NOW(), 
  '%i minutes and %s seconds after %h%p on %W the %D of %M, in the year of %Y.') 
  AS "Date statement"
FROM dual;</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT DATE_FORMAT(
  NOW(), 
  '%i minutes and %s seconds after %h%p on %W the %D of %M, in the year of %Y.') 
  AS "Date statement"
FROM dual;</textarea>
    </div>
  </div>
</section>
<section class="section-break">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Formatting dates is especially important because if you want to <em>compare</em> dates, or insert a date value into a column, the formats must be the same!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>It's always important to compare "apples to apples".</p>
      <p>You can use <code>CAST()</code> or <code>CONVERT()</code> to convert data from one type to another, but why not use the specialized function of <code>STR_TO_DATE()</code>?</p>
      <p>This function works for dates, times, and datetimes.</p>
      <pre class="slide-only"><code class="language-sql">SELECT STR_TO_DATE(
  '2019-11-03 22:03:11', 
  '%Y-%m-%d %H:%i:%s')
FROM dual;</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT STR_TO_DATE(
  '2019-11-03 22:03:11', 
  '%Y-%m-%d %H:%i:%s')
FROM dual;</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Working with dates</h2>
      <pre class="slide-only"><code class="language-sql">SELECT DATE_ADD('2019-05-01', INTERVAL 1 MONTH) 
FROM dual;
-- Returns 2019-06-01
SELECT DATE_SUB('2020-03-01', INTERVAL 1 DAY) 
FROM dual;
-- Returns 2019-2-29</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="310" cols="50" class="post-only">SELECT DATE_ADD(
  '2019-05-01', 
  INTERVAL 1 MONTH) 
FROM dual;
-- Returns 2019-06-01
SELECT DATE_SUB(
  '2020-03-01', 
  INTERVAL 1 DAY) 
FROM dual;
-- Returns 2019-2-29</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <pre class="slide-only"><code class="language-sql">-- DATEDIFF returns the difference between two dates 
-- <em>in days</em>
SELECT DATEDIFF('2020-10-31', NOW()) FROM dual;</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="190" cols="50" class="post-only">-- DATEDIFF returns the difference 
-- between two dates in days
SELECT DATEDIFF(
  '2020-10-31', 
  NOW()) 
FROM dual;</textarea>
    </div>
  </div>
</section>
<section id="lab">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Lab time!</h2>
      <p>The second semester is going to be more "hands-on".</p>
      <p>When presenting material, you have to choose between the simple/abstract and the complex/concrete.</p>
      <p>We're going to do some more concrete things, but you're going to have to wade through more complexity. Case in point: our lab today!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>I've created a basic PHP CRUD app that works off of our database server.</p>
      <p>The purpose of this is to show how SQL works with server-side code.</p>
      <p>We'll take a look at it together, and then you can get it on your machine so you can peruse the code.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p><strong>Here are your lab questions:</strong></p>
      <ol>
        <li>Before you've cloned/downloaded the code, how would you design the database table for this application?</li>
        <li>Looking at the code, does it look the way you expected?</li>
        <li>What additional features could this application have? How would you implement them (from the perspective of the database, but also the user interface).</li>
      </ol>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p><strong>Here are the instructions for running this application locally:</strong></p>
      <ul>
        <li>Open your terminal or command prompt. Using <code>cd</code>, navigate to a folder where you store your projects.</li>
        <li>If you don't have git installed, <a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git" target="_blank">you may as well do it now</a>. You'll need it eventually.</li>
        <li>In your terminal, run this code: <code>git clone https://github.com/simonborer/php-todo.git</code></li>
        <li>If you're really stuck on being able to install git, you can <a href="https://github.com/simonborer/php-todo/archive/master.zip" target="_blank">download this project here</a>.</li>
        <li>Read through the `readme` file (you should always read a project's `readme` file).</li>
      </ul>
    </div>
  </div>
</section>