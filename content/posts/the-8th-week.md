---
title: "Week 8 - Working on Stored Procedures"
date: 2019-10-22T08:47:11+01:00
publishdate: 2020-11-02T08:47:11+01:00
featured_image: failed.jpg
summary: "This week review the midterm, and cover stored procedures and user-defined functions; optional parameters, input and output parameters; how to raise errors"
today:
  -
    title: Reviewing the midterm
    id: midterm
  -
    title: Procedures vs Functions
    id: vs
  -
    title: Stored Procedures
    id: procedures
  -
    title: User-defined Functions
    id: functions
  -
    title: Assignment
    id: lab
---
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Happy Cheap Candy Day!</h2>
      <p class="h1">🍬🍭🍬</p>
    </div>
  </div>
</section>
<%- include(`${part}today`) %>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>I was pretty pleased with the grade distribution - lots of 80's and 90's.</p>
      <p>The average was 74%, with a nice smooth bell curve.</p>
      <img src="<%- basePath %>/assets/images/curve.png" alt="Smooth distribution of grades along a bell curve." />
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>If the exam was a wake-up call - don't worry, we're going to go over everything today.</p>
      <p>Also, I suspect a number of you are not using the textbook. It is a really good resource. If you read the assigned chapters for each week, you <em>will</em> understand that week's content. I've even designed some of our data sets to align with the examples in the book.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x" id="<%- page.today[0].id %>">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Lettered questions</h2>
      <p>Nearly everyone was able to get all of these. For those of you who struggled, please refer back to Module 3 where we discussed Entity Relationship diagrams, and Module 6 where we did a deep dive on primary and foreign keys.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 1</h2>
      <blockquote>Return a column called “Teacher Full Name” that combines their last and first names, separated by a comma.</blockquote>
      <pre><code class="language-sql">SELECT teacherlname || ', ' || teacherfname AS "Teacher Full Name"
FROM teachers</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 2</h2>
      <blockquote>Return a column called “Seniority” that shows how long it has been since a teacher was hired, and order it starting with the most seniority.</blockquote>
      <pre><code class="language-sql">SELECT teacherid, ROUND(SYSDATE - hiredate) AS "Seniority"
FROM teachers
ORDER BY "Seniority" DESC</code></pre>
      <p>This one gave a few people trouble. Maybe it was how the question was worded, but the answer was meant to be not just the date of hiring, but the difference between <code>hiredate</code> and the current date. I gave out a lot of half marks for this.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 3</h2>
      <blockquote>Find all the students with a last name starting with the letters A through E.</blockquote>
      <pre><code class="language-sql">SELECT * FROM students
WHERE UPPER(SUBSTR(studentlname, 1, 1)) BETWEEN 'A' and 'E'</code></pre>
      <p>A few of you still want to use a range instead of an array, which, <em>technically</em>, works. I may have given you this one.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 4</h2>
      <blockquote>Return a list of the top 5 highest paid teachers and their salary to the nearest dollar.</blockquote>
      <pre><code class="language-sql">SELECT teacherid, ROUND(salary) AS Salary 
FROM teachers
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY</code></pre>
      <p>Remember, <code>FETCH</code> gets executed after <code>ORDER BY</code>, but <code>ROWNUM</code> doesn't.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 5</h2>
      <blockquote>Vanessa Cox (studentid = 43, studentnumber = N1712) Is asking about their registered courses. Print out a list of classes this student is enrolled in.</blockquote>
      <pre><code class="language-sql">SELECT classname FROM studentsxclasses
JOIN classes USING(classid)
WHERE studentid = 43</code></pre>
      <p>Remember, <code>FETCH</code> gets executed after <code>ORDER BY</code>, but <code>ROWNUM</code> doesn't.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 6</h2>
      <blockquote>Print a list of every class which has a teacher assigned to it. Include the teacher’s name.</blockquote>
      <pre><code class="language-sql">SELECT classname, teacherfname || ' ' || teacherlname AS teacher 
FROM classes
JOIN teachers USING(teacherid)</code></pre>
      <p>Okay, a lot of you were <em>all over the place</em> with your joins. I suggest reviewing which joins do what, because problems like this take a little bit of thinking.</p>
      <p>In this case, an inner join selects all classes with an assigned teacher because if there's no teacher, the join omits the class row.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 7</h2>
      <blockquote>Print out a list of classes in the fall 2018 semester. The fall semester starts in September 2018 and ends in December 2018.</blockquote>
      <pre><code class="language-sql">SELECT classname AS "Fall Classes" FROM classes
WHERE TO_CHAR(startdate, 'YY-MM') = '18-09'
    AND TO_CHAR(finishdate, 'YY-MM') = '18-12'
</code></pre>
      <p>Okay, we need to start treating dates <strong>as dates</strong>, not strings. This came up in a bunch of questions. Respect the data type.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 8</h2>
      <blockquote>Find classes not in the web program. Note: the web program classes are all prefixed with ‘http’.</blockquote>
      <pre><code class="language-sql">SELECT * FROM classes
WHERE LOWER(classcode) NOT LIKE ('http%')</code></pre>
      <p>You did really well on this one. A few of you might want to brush up on how the wildcards (<code>%</code>, which means any number of any characters, and <code>_</code>, which means one of any character) work.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 9</h2>
      <blockquote>Find students who enrolled in August. Order by their last name, then by their first name.</blockquote>
      <pre><code class="language-sql">SELECT * FROM students
WHERE TO_CHAR(enrolmentdate, 'MM') = '08'
ORDER BY studentlname, studentfname</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 10</h2>
      <blockquote>Find the average teacher’s salary.</blockquote>
      <pre><code class="language-sql">SELECT AVG(salary) FROM teachers</code></pre>
      <p>You all did pretty great on this one and the next. You know aggregate functions!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 11</h2>
      <blockquote>Find when the first teacher was hired.</blockquote>
      <pre><code class="language-sql">SELECT MIN(hiredate) FROM teachers</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 12</h2>
      <blockquote>Linda Chan (teacherid = 3) teaches Web Application Development 2 (classid = 7) in the winter semester. She needs an attendance sheet organized by students’ last name, then by the students’ first name. Print out a list of students who are registered in this class, including their student number.</blockquote>
      <pre><code class="language-sql">SELECT studentid, studentlname, studentfname FROM studentsxclasses
JOIN students USING(studentid)
WHERE classid = 7
ORDER BY studentlname, studentfname</code></pre>
      <p>I didn't dock any points for this, but be careful not to add unnecessary filters.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 13</h2>
      <blockquote>Find teachers with no classes. Hint: Counting classes per teacher.</blockquote>
      <pre><code class="language-sql">SELECT t.teacherid, teacherfname, teacherlname FROM teachers t
LEFT JOIN classes c
ON t.teacherid = c.teacherid
WHERE c.teacherid IS NULL</code></pre>
      <p>Ugh, ok, this one's on me. I meant to remove the 'hints' on this and the next question. They were <em>not</em> helpful. A few of you got these questions correct, but most people got a half mark for trying to kludge something together with the <code>COUNT()</code> function.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 14</h2>
      <blockquote>Find classes with no students. Hint: Counting students per classroom. </blockquote>
      <pre><code class="language-sql">SELECT * FROM classes c
LEFT JOIN studentsxclasses sxc
ON c.classid = sxc.classid
WHERE sxc.classid IS NULL</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 15</h2>
      <blockquote>Find students with less than 5 classes.</blockquote>
      <pre><code class="language-sql">SELECT studentid, COUNT(*) FROM studentsxclasses
GROUP BY studentid
HAVING COUNT(*) < 5</code></pre>
      <p><code>GROUP BY</code> and <code>HAVING</code> add a bit of complexity to aggregate functions, but a lot of you got this. Great work!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 16</h2>
      <blockquote>Print out a list that reads “x teaches y classes”, where x is the teacher’s name, and y is the number of classes they teach. Include the teachers that teach 0 classes.</blockquote>
      <pre><code class="language-sql">SELECT 
    teacherfname || 
    ' ' || teacherlname || 
    ' teaches ' || COUNT(classid) || 
    ' class(es).'
FROM teachers LEFT JOIN classes USING(teacherid)
GROUP BY teacherid, teacherfname, teacherlname</code></pre>
      <p>A lot of folks forgot that, if you're going to select a column while using an aggregate function, you need to reference it in the <code>GROUP BY</code> clause.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 17</h2>
      <blockquote>Modify the above query so that the printed string include “this semester” and only select classes which are this semester. This semester begins in September and ends in December.</blockquote>
      <pre><code class="language-sql">SELECT 
    teacherfname || 
    ' ' || teacherlname || 
    ' teaches ' || COUNT(classid) || 
    ' class(es) this semester.' AS "Who teaches what"
FROM teachers LEFT JOIN (
    SELECT * FROM classes
    WHERE TO_CHAR(startdate, 'YY-MM') = '18-09'
    AND TO_CHAR(finishdate, 'YY-MM') = '18-12'
)
USING(teacherid)
GROUP BY teacherid, teacherfname, teacherlname</code></pre>
      <p class="smaller-text">Ok, nobody <em>fully</em> got this one. It's tricky. To include teachers that teach zero classes (like in the previous question), we have to get <em>all</em> the teachers (via a left join), and then use a subquery to select only those classes that are in the fall semester.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 18</h2>
      <blockquote>Add yourself to the students table. Use your student number and name. Assume the highest student id in the table is 99.</blockquote>
      <pre><code class="language-sql">INSERT INTO students (
  studentid, studentfname, 
  studentlname, studentnumber, 
  enrolmentdate
)
VALUES (
  100, 'Simon', 
  'Borer', 1234567, 
  TO_DATE('18-06-18', 'YY-MM-DD')
)</code></pre>
      <p>Pretty much everybody got the CRUD questions.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 19</h2>
      <blockquote>Put yourself into 3 classes that are offered next semester.</blockquote>
      <pre><code class="language-sql">INSERT INTO studentsxclasses (studentxclassid, studentid, classid)
VALUES ((SELECT MAX(studentxclassid) + 1 FROM studentsxclasses), 100, 6)

INSERT INTO studentsxclasses (studentxclassid, studentid, classid)
VALUES ((SELECT MAX(studentxclassid) + 1 FROM studentsxclasses), 100, 7)

INSERT INTO studentsxclasses (studentxclassid, studentid, classid)
VALUES ((SELECT MAX(studentxclassid) + 1 FROM studentsxclasses), 100, 8)</code></pre>
      <p>Note that you need separate <code>INSERT</code>s for each row.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 20</h2>
      <blockquote>Change your record. Make your student number the first five characters of your original student number.</blockquote>
      <pre><code class="language-sql">UPDATE students SET studentid = 12345
WHERE studentid = 100</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 21</h2>
      <blockquote>Drop one of the three courses you put yourself into.</blockquote>
      <pre><code class="language-sql">DELETE FROM studentsxclasses 
WHERE studentid = 100
AND classid = 8</code></pre>
      <p>Less people got this one, maybe because the word 'drop' threw you off. Also note that you had to filter for your student id <strong>and</strong> the course you wanted to drop.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 22</h2>
      <blockquote>Save your changes to the database.</blockquote>
      <pre><code class="language-sql">COMMIT</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x" id="<%- page.today[1].id %>">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2"><%- page.today[1].title %></h2>
      <p><strong>Procedures</strong> are a set of tasks, i.e. CRUD functions. They <em>can</em> return a value, but that's not what they're for. They <em>can't</em> be used in queries and statements. Simply put, they're for changing things.</p>
      <p><strong>Functions</strong> are for returning values. They don't change stuff.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x" id="<%- page.today[2].id %>">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2"><%- page.today[2].title %></h2>
      <pre><code class="no-max language-sql">CREATE OR REPLACE PROCEDURE update_invoices_credit_total /* Give it a name */
(
    /*  our parameters - the options we'll pass in when 
        we call the procedure */
    invoice_number_param     VARCHAR2,
    credit_total_param      NUMBER
)
AS
/* Define the procedure as PL/SQL code */
BEGIN
    UPDATE invoices
    SET credit_total = credit_total_param
    WHERE invoice_number = invoice_number_param;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>After we run this as a script, it's stored in the database. We can call it like this:</p>
      <pre><code class="language-sql">CALL update_invoices_credit_total('367447', 400);</code></pre>
      <p>Note that it won't give us any feedback beyond <code>Call completed.</code></p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>If we're calling the function in a script, we can write it simply as...</p>
      <pre><code class="language-sql">BEGIN
  update_invoices_credit_total('367447', 400);
END;
/</code></pre>
      <p>We can also reference our parameters if we want to do them out of order, or omit optional parameters, like so:</p>
      <pre><code class="language-sql">BEGIN
  update_invoices_credit_total(
    credit_total_param=>500, 
    invoice_number_param=>'367447'
  );
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>We can also define our parameters as input or output parameters. Parameters are input (as in, they get passed into the procedure) by default. Output parameters <strong>can't</strong> be returned to a statement, but can be output to the script output (<code>DMBS_OUTPUT.PUT_LINE</code>).</p>
      <p>Parameters can also be made optional by supplying a default.</p>
      <pre class="post-only"><code class="language-sql">CREATE OR REPLACE PROCEDURE update_invoices_credit_total
(
    /* declare in/out here */
    invoice_number_param        IN      VARCHAR2,
    credit_total_param          IN      NUMBER,
    update_count                OUT     INTEGER,
    /* declare defaults last */
    totally_optional            IN      NUMBER  DEFAULT   100
)
AS
BEGIN
    UPDATE invoices
    SET credit_total = credit_total_param
    WHERE invoice_number = invoice_number_param;

    SELECT COUNT(*) + totally_optional
    INTO update_count
    FROM invoices
    WHERE invoice_number = invoice_number_param;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        SELECT 0 INTO update_count FROM dual;
        ROLLBACK;
END;</code></pre>
      <pre class="post-only"><code class="language-sql">SET SERVEROUTPUT ON;
DECLARE
    row_count INTEGER;
BEGIN
    /* output parameter named here */
    update_invoices_credit_total('367477', 200, row_count);
    /* outpute parameter referenced here */
    DBMS_OUTPUT.PUT_LINE('row_count: ' || row_count);
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Raising errors</h2>
      <p>Because stored procedures are an abstraction - we're removing some of the logic from the working space - it's important to validate data and raise informative errors.</p>
      <p class="callout">You can refer to the Oracle docs for their full list of <a href="https://docs.oracle.com/cd/E11882_01/timesten.112/e21639/exceptions.htm#CIHFIGFE" target="_blank">error types</a>.</p>
      <pre class="post-only"><code class="language-sql">CREATE OR REPLACE PROCEDURE update_invoices_credit_total
(
    invoice_number_param    VARCHAR2,
    credit_total_param  NUMBER
)
AS
BEGIN
    IF credit_total_param < 0 THEN
        RAISE VALUE_ERROR;
    END IF;
    
    UPDATE invoices
    SET credit_total = credit_total_param
    WHERE invoice_number = invoice_number_param;

    COMMIT;
END;</code></pre>
    <pre class="post-only"><code class="language-sql">/* using the error category for output */
SET SERVEROUTPUT ON;

BEGIN 
    update_invoices_credit_total('367477', -25);
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('A value error occurred');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unknown error occurred');
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x" id="<%- page.today[3].id %>">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2"><%= page.today[3].title %></h2>
      <p>Creating a function:</p>
      <pre><code class="no-max language-sql">CREATE OR REPLACE FUNCTION get_vendor_id
(
  /* reference the data type of the appropriate column */
  vendor_name_param vendors.vendor_name%TYPE 
)
RETURN NUMBER
AS
  vendor_id_var NUMBER;
BEGIN 
  SELECT vendor_id
  INTO vendor_id_var
  FROM vendors
  WHERE vendor_name = vendor_name_param;

  RETURN vendor_id_var;
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x" id="<%- page.today[3].id %>">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">

      <p>Calling the function:</p>
      <pre><code class="language-sql">SELECT 
  invoice_number, 
  invoice_total
FROM invoices
WHERE vendor_id = get_vendor_id('IBM')</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x" id="<%- page.today[1].id %>">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Lab time!</h2>
      <ol>
        <li>Create a stored procedure or function for anything from the previous weeks, the syntax of which you find difficult to remember.</li>
        <li>Create 2 tables, one called my_books, one called my_movies. In each, create a primary key, a column called 'title', a column called 'genre', and a column called 'rank'. Then create a stored procedure that can insert a row into either of those tables, with the values passed as parameters. Insert at least 3 each of your favourite books and movies into the tables using your procedure.</li>
        <li>Create a stored function that can return the title based on your ranking.</li>
      </ol>
    </div>
  </div>
</section>

