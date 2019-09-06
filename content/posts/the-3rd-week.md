---
title: "Week 3 - Join Operations"
date: 2019-09-17T08:47:11+01:00
publishdate: 2019-09-02T08:47:11+01:00
featured_image: venn.png
summary: "This week we'll cover coding INNER JOINs to retrieve rows from multiple tables; the use of a self-join; table aliases; JOIN with implicit INNER JOIN syntax; OUTER JOINs to retrieve rows form multiple tables; the various set operators."
---
<section>
    <h2 class="slide-only">Here's what we're going to do today:</h2>
    <div class="grid-x">
      <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
        <ol class="toc">
            <li><a href="#labLessons">Lessons from the lab</a></li>
            <li><a href="#whatsYourFunction">How do we use functions?</a></li>
            <li><a href="#joins">Selecting data from multiple tables</a></li>
            <li><a href="#onClause">The <code>ON</code> clause</a></li>
            <li><a href="#tableAliases">Table aliases</a></li>
            <li><a href="#outerJoins">Outer joins</a></li>
            <li><a href="#crossJoin">Cross joins</a></li>
            <li><a href="#schema">Schema & ER diagrams</a></li>
            <li><a href="#joiningMultiple">Joining multiple tables</a></li>
            <li><a href="#selfJoin">Self joins</a></li>
            <li><a href="#syntaxVariations">Syntax variations</a></li>
            <li><a href="#other">Other table merges</a></li>
            <li><a href="#lab">Lab</a></li>
        </ol>
      </div>
    </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Happy Thursday!</h2>
    </div>
  </div>
</section>
<section id="labLessons">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Lessons from the lab</h2>
      <p>Overall, you all did well on the lab. Let's review some of the common mistakes/misunderstandings.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 1</h2>
      <blockquote>
        <ul>
          <li>Write a query to display the vendor id, vendor name, vendor city and vendor state.</li>
          <li>Only display vendors located in the following states: MI, OH, PA, NV, and TN.</li>
          <li>Only display rows where the vendor city begins with either the letter C or the letter A.</li>
          <li>The results are to be sorted first on the vendor state then by vendor city within the state.</li>
        </ul>      
      </blockquote>
      <pre><code class="language-sql">SELECT vendor_id, vendor_name, vendor_city, vendor_state 
FROM vendors
WHERE vendor_state IN ('MI','OH','PA','NV','TN')
AND SUBSTR(VENDOR_CITY,1,1) IN ('C','A')
/* or (vendor_city LIKE 'C%'
OR vendor_city LIKE 'A%') */
ORDER BY vendor_state, vendor_city
      </code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <div class="callout primary">
        <h2 class="h2">Choosing between syntax options</h2>
        <p>There are times when you have more than one option for how to phrase a query.</p>
        <pre><code class="language-sql">SUBSTR(VENDOR_CITY,1,1) IN ('C','A')</code></pre>
        <pre><code class="language-sql">(vendor_city LIKE 'C%'
OR vendor_city LIKE 'A%')</code></pre>
        <p>Things to consider:</p>
        <ul>
            <li>Brevity</li>
            <li>Readability</li>
            <li>Complexity</li>
            <li>Performance</li>
          </ul>  
      </div>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Two common mistakes</h2>
      <pre><code class="language-sql">SELECT vendor_id, vendor_name, vendor_city, vendor_state 
FROM vendors
WHERE vendor_state = 'MI' 
  OR vendor_state= 'PA' 
  OR vendor_state= 'OH' 
  OR vendor_state= 'NV' 
  OR vendor_state= 'TN'
AND vendor_city LIKE 'C%'
OR vendor_city LIKE 'A%'
ORDER BY vendor_state, vendor_city</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Subqueries</h2>
      <p>We're not going to learn about subqueries for awhile, but let's talk about them because I saw someone using them.</p>
      <pre><code class="language-sql">SELECT vendor_id, invoice_total 
FROM invoices
WHERE invoice_total <= (SELECT payment_total 
  FROM invoices 
  WHERE ROWNUM = 1)</code></pre>
      <small>This query is for demonstration purposes - it's nonsensical from a business perspective.</small>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 2</h2>
      <blockquote>
        <ul>
          <li>Write a query that will display the vendor name, vendor_address1, vendor city, vendor state.</li>
          <li>Only display vendors where the vendor_address1 contains the text PO Box in any format (check the data first to see how PO box is written)...</li>
          <li>...in the vendor state of CA.</li>
          <li>The results are to be displayed in descending sequence on the vendor name.</li>
        </ul>      
      </blockquote>
      <pre><code class="language-sql">SELECT 
  vendor_name, 
  vendor_address1, 
  vendor_city, 
  vendor_state 
FROM vendors
WHERE vendor_address1 LIKE '%P%O% Box%'
AND vendor_state = 'CA'
ORDER BY vendor_name DESC</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 3</h2>
      <blockquote>
        <ul>
          <li>Write a query to show which vendors do not have a phone number.</li>
          <li>Display the vendor name, vendor contact last name, and vendor contact first name and vendor phone.</li>
          <li>Display the rows under vendor phone so it displays as N/A.</li>
          <li>The results are to be displayed in sequence by the vendor’s last name then by the vendor’s first name both in ascending sequence.</li>
        </ul>      
      </blockquote>
      <pre><code class="language-sql">SELECT 
  vendor_name, 
  vendor_contact_last_name, 
  vendor_contact_first_name, 
  REPLACE(vendor_phone, 'NULL', 'N/A')
FROM vendors
WHERE vendor_phone = 'NULL'
ORDER BY vendor_contact_last_name, vendor_contact_first_name</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Common mistakes</h2>
      <pre><code class="language-sql">NVL(NULL, 'N/A')</code></pre>
      <pre><code class="language-sql">REPLACE('N/A','NULL','N/A')</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 4</h2>
      <blockquote>
        <ul>
          <li>Write a query to display the vendor id, invoice total, payment total, and payment date.</li>
          <li>Only show records where the invoice total is greater than 10,000.</li>
          <li>Also only show records where the payment date has no value.</li>
          <li>Display the results in ascending sequence based on invoice total.</li>
        </ul>      
      </blockquote>
      <pre><code class="language-sql">SELECT 
    vendor_id, 
    invoice_total,
    payment_total,
    payment_date
FROM invoices
WHERE invoice_total > 10000 
    AND payment_date IS NULL
ORDER BY invoice_total</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Question 5</h2>
      <blockquote>
        <ul>
          <li>Write a query to display the 1) invoice number, 2) vendor id, 3) invoice date, and 4) the result of invoice total minus payment total plus credit total, adding the payment total and credit total first then subtracting that sum from invoice total.</li>
          <li>Display the results using an alias called Balance Due.</li>
          <li>Only display records from May of '14 or April of '14, and...</li>
          <li>...records where the result of Balance Due is not equal to zero.</li>
          <li>Display the results in ascending sequence on Balance Due (or the calculation of that column).</li>
        </ul>      
      </blockquote>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <pre><code class="language-sql">SELECT 
    invoice_number,
    vendor_id, 
    invoice_date,
    invoice_total - (payment_total + credit_total) 
  AS "Balance Due"
FROM invoices
WHERE invoice_total - (payment_total + credit_total) <> 0 
  AND invoice_date BETWEEN '2014-04-01' AND '2014-05-31'
ORDER BY "Balance Due"</code></pre>
    <p>It's nice to order by the alias - if changes have to be made, we only have to change things in one place.</p>
    <p>Too bad we can't use aliases in the <code class="language-sql">WHERE</code> clause!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">A common <del>mistake</del> <ins>hack</ins></h2>
      <pre><code class="language-sql">invoice_date LIKE '14-05%' OR invoice_date LIKE '14-04%'</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1 post-section">
      <h2>Something else from last class</h2>
      <p>Let's keep going with the auto theft data.</p>
      <p>Run <code class="language-sql">SELECT * FROM autotheft</code> so we can see the base table, then we'll look at what kind of return table we get when we run some functions.</p>
      <p><em>If your data didn't persist, you can run <a href="/documents/autotheft.sql">autotheft.sql</a> again.</em></p>
    </div>
  </div>
</section>
<section id="whatsYourFunction">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">What is a function?</h2>
      <p>I had a few people approach me who weren't clear on how functions... function. Since we're going to learn about a new kind of function today, let's make sure we're all clear on how we can think about them.</p>
      <p><strong>Functions return values.</strong> Could be a string, a number, etc.</p>
      <p><em>Where do you use them in queries?</em></p>
      <p>A function goes anywhere a value could go, or anywhere a column name could go (as we reference column names in order to return a value from each row in a SELECT statement).</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <pre><code class="language-sql">/* For each row in the table, 
output one row of VALUE, VALUE, VALUE */
SELECT occurrencedayofweek, UPPER(neighbourhood), 7 AS SEVEN 
/* ...from this table */
FROM autotheft
/* ...if VALUE has relationship with VALUE */
WHERE reporteddayofweek = occurrencedayofweek
AND UPPER(neighbourhood) LIKE UPPER('%KENSINGTON%')
/* ...sort the resulting rows based on VALUE */
ORDER BY LOWER(occurrencedayofweek)</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Aside: Pseudocode</h2>
      <p>Pseudocode is an awesome mental tool for coding, particularly when you're dealing with complexity. The first step in my coding process is often to write out what I want my code to say, and then translate plain english into code.</p>  
    </div>
  </div>
</section>
<section id="joins">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">JOINS! <span role="image" aria-label="backhand index pointing right">👉</span><span role="image" aria-label="backhand index pointing left">👈</span></h2>
      <p>A join is when you merge data from two (or more) different tables to create your results table.</p>  
      <p>Usually, joins are what we call an 'inner join'. Inner join is the default. You don't even have to write <code class="language-sql">INNER JOIN</code>, you can just write <code class="language-sql">JOIN</code>.</p>
      <p>The different types of joins refer to what data to include from which table.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <img class="diagram" src="/images/join-example.png" alt="Simple demonstration of the results of different joins.">
    </div>
  </div>
</section>
<section id="onClause">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>We define a relationship between two tables by using the clause <code class="language-sql">ON</code></p>
      <p>Let's see a table of invoices with the vendor name and the date they paid.</p>
      <pre><code class="language-sql">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on" 
FROM invoices
JOIN vendors ON invoices.vendor_id = vendors.vendor_id</code></pre>
      <p>The invoice due date and the paid date come from the <code>invoices</code> table, but the vendor name comes from the vendors table. We can retrieve information about a vendor by looking up the vendor's id. This way the <code>invoices</code> table doesn't have to repeat information about every vendor - we just have to store it once in the <code>vendors</code> table.</p>
      <p>This is an inner join, which means the results table will <em>only</em> show a row for invoices that have a vendor <strong>and</strong> vendors that have an invoice.</p>
    </div>
  </div>
</section>
<section id="tableAliases">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Let's run that code again, with a slight modification to produce an error! <span role="image" aria-label="fire">🔥</span><span role="image" aria-label="Person gesturing no">🙅</span><span role="image" aria-label="fire">🔥</span></p> 
      <pre><code class="language-sql">SELECT invoice_due_date, vendor_id, payment_date
FROM invoices
JOIN vendors ON invoices.vendor_id = vendors.vendor_id</code></pre>
      <p>...gives us the error <code>column ambiguously defined</code>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>When two tables have the same column name, we have to specify what table the column is coming from. We do this by prefixing the column name with the table name and a dot.</p>
      <p>To make this easier, we can alias our tables, similar to how we alias our columns, but without the need for the <code>AS</code> operator. We can simply add the alias with a space after the table name in the join syntax.</p>
      <pre><code class="language-sql">SELECT invoice_due_date, v.vendor_id, payment_date
FROM invoices i
JOIN vendors v 
ON i.vendor_id = v.vendor_id</code></pre>  
    </div>
  </div>
</section>
<section id="outerJoins">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>We've seen a list of all the invoices and their associated vendors. What if we wanted to include vendors that <em>didn't</em> have an invoice? That's where we'd use an outer join - in this case, a <code class="language-sql">RIGHT JOIN</code> because we want to include data that only appears on the <strong>right</strong> side of the <code>JOIN</code> clause.</p>
      <pre><code class="language-sql">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on" 
FROM invoices /* left side */ 
RIGHT JOIN vendors /* right side */ 
ON invoices.vendor_id = vendors.vendor_id
ORDER BY "Due on" DESC</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Let's look at a few more examples!</p>
      <p>Run this sql script: <a href="/documents/create_om_tables.sql">create_om_tables.sql</a></p>
      <p>A 'left' outer join, as you'd expect, works the same way as a right join, only it includes records that are only from the left side of the join.</p>
      <pre><code class="language-sql">SELECT department_name, d.department_number, last_name
FROM departments d
LEFT JOIN employees e
ON d.department_number = e.department_number</code></pre>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">  
      <p>A join creates a row by <strong>merging</strong> rows from different tables.</p>
      <p>An inner join will <strong>only</strong> created a row <em>if</em> there are two rows to merge - only if a match can be found based on the <code>ON</code> clause.</p>
      <p>A left join will create a row for <em>every</em> row in the first table, even if there is no match for a row from <strong>the second</strong> table. A right join will do the opposite - create a row in the results table for every row in the <em>second</em> table, even if there is no match from <strong>the first table.</strong></p>
      <p>A full join creates a row for every row in <em>both</em> tables - whether or not they can be merged.</p> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p><img class="diagram" src="/images/basic-joins.png" alt="Four diagrams illustrating four types of JOIN"></p>  
    </div>
  </div>
</section>
<section id="crossJoin">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Cross joins - don't let them throw you off.</h2>
      <p>There's another type of join, but don't get it confused with inner or outer joins. The cross join (or 'Cartesian join') <em>doesn't</em> merge rows - it multiplies them.</p>
      <pre><code class="language-sql">SELECT department_name, first_name
FROM departments, employees</code></pre>  
      <p>For every row in the first table, it returns a copy appended with every row in the second table.</p>
      <p><strong>This is not used often.</strong></p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Let's review our types of joins</h2>
      <h3 class="h3">Say we have two tables: one for assignments, one for students.</h3>
    </div>
  </div>
  <div class="grid-x">
    <div class="cell large-offset-3 large-6 medium-10 medium-offset-1 text-center slide-half-col">
      <table class="base-table">
        <thead>
          <tr>
            <td colspan="2" class="text-center"><strong>Assignments</strong></td>
          </tr>
          <tr>
            <td>Class</td>
            <td>Assignment</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Lab</td>
          </tr>
          <tr>
            <td>4</td>
            <td>Exam</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="cell large-offset-3 large-6 medium-10 medium-offset-1 text-center slide-half-col">
      <table class="base-table">
        <thead>
          <tr>
            <td colspan="2" class="text-center"><strong>Students</strong></td>
          </tr>
          <tr>
            <td>Class</td>
            <td>Student</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>2</td>
            <td>Birinder</td>
          </tr>
          <tr>
            <td>3</td>
            <td>Amandeep</td>
          </tr>
          <tr>
            <td>4</td>
            <td>Ryan</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="grid-x post-only">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Run this script to follow along:</p>
      <pre><code class="language-sql">SET DEFINE OFF;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE assignments';
  EXECUTE IMMEDIATE 'DROP TABLE students';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE assignments
(
    class           NUMBER   NOT NULL,
    assignment     VARCHAR(50)   NOT NULL
);

CREATE TABLE students
(
    class           NUMBER   NOT NULL,
    student      VARCHAR(50)   NOT NULL
);

INSERT INTO assignments VALUES (1, 'Lab');
INSERT INTO assignments VALUES (2, 'Paper');
INSERT INTO assignments VALUES (3, 'Exam');
INSERT INTO students VALUES (2, 'Birinder');
INSERT INTO students VALUES (3, 'Amandeep');
INSERT INTO students VALUES (4, 'Ryan');

COMMIT;</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3>Inner join</h3>
      <pre><code class="language-sql">SELECT student, assignment
FROM assignments
JOIN students
ON assignments.class = students.class</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td>Exam</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3>Left (outer) join</h3>
      <pre><code class="language-sql">SELECT student, assignment
FROM assignments
LEFT JOIN students
ON assignments.class = students.class</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td>Exam</td>
          </tr>
          <tr>
            <td><code>(null)</code></td>
            <td>Lab</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3>Right (outer) join</h3>
      <pre><code class="language-sql">SELECT student, assignment
FROM assignments
RIGHT JOIN students
ON assignments.class = students.class</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td>Exam</td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td><code>(null)</code></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3>Full (outer) join</h3>
      <pre><code class="language-sql">SELECT student, assignment
FROM assignments
FULL JOIN students
ON assignments.class = students.class</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td>Exam</td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td><code>(null)</code></td>
          </tr>
          <tr>
            <td><code>(null)</code></td>
            <td>Lab</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3>Cross join</h3>
      <pre><code class="language-sql">SELECT student, assignment
FROM assignments, students</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Birinder</td>
            <td>Exam</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td>Exam</td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td>Exam</td>
          </tr>
          <tr>
            <td>Birinder</td>
            <td>Lab</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td>Lab</td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td>Lab</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <div class="callout alert">
        <p>Why would we <code>RIGHT JOIN</code> table A with table B when we could <code>LEFT JOIN</code> table B with table A?</p>  
        <p>The answer is, normally, we wouldn't. Right joins only really come in handy when we're joining more than one table and things start to get awkward syntactically.</p>
      </div>
    </div>
  </div>
</section>
<section id="schema">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Schema</h2>
      <p>Wouldn't it be nice if you could spend all day writing out your <code>JOIN</code>s without having to always look up which table has which columns by clicking on them individually in SQLDeveloper? And wouldn't it be even better if you had some way of quickly visualizing the relationships between between tables?</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Entity relationship diagrams</h2>
      <p><img src="/images/er.png" alt="An entity relationship diagram"></p>  
      <p>You can make your own!</p>
      <p>In SQLDeveloper, go to <code>File > Data Modeler > Import > Data Dictionary</code>, highlight your connection, click <code>Next</code>, find your username (student number), click <code>Next</code> again, choose the tables that you'd like to diagram, and click <code>Finish</code></p>
      <p>Your diagram comes with a good amount of information, including all columns, their data types, keys, and, particularly helpful, the arrows and crow's feet. This signify a one-to-many relationship.</p>
      <p>This will particularly come in handy when you're...</p>
    </div>
  </div>
</section>
<section id="joiningMultiple">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Joining multiple tables</h2>
      <pre><code class="language-sql">SELECT 
    vendor_name, 
    invoice_number, 
    invoice_date, 
    line_item_amt, 
    account_description
FROM vendors v
    JOIN invoices i
        ON v.vendor_id = i.vendor_id
    JOIN invoice_line_items li
        ON i.invoice_id = li.invoice_id
    JOIN general_ledger_accounts gl
        ON li.account_number = gl.account_number
WHERE (invoice_total - payment_total - credit_total) > 0
ORDER BY vendor_name, line_item_amt DESC</code></pre>
      <p>Tables can effectively be 'chained' together using joins.</p>
      <p class="callout alert">This can come in particularly handy when using an intermediary table to break up a many-to-many relationship into two one-to-many relationships.</p>
    </div>
  </div>
</section>
<section id="selfJoin">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Joining a single table (to itself)</h2>
      <pre><code class="language-sql">SELECT DISTINCT v1.vendor_name, v1.vendor_city
FROM vendors v1 JOIN vendors v2
    ON (v1.vendor_city = v2.vendor_city) AND
    (v1.vendor_id <> v2.vendor_id)
ORDER BY v1.vendor_city</code></pre>
      <p>Okay, this is a bit weird, but let's think it through. This query joins two tables (one just happens to be a duplicate of the other). We're used to joining things on a key, like an id, that is unique for at least one of the tables, but in this case we're joining on the city. So this query produces a list of all rows from one table that have the same city as the rows in the other table (<code>v1.vendor_city = v2.vendor_city</code>).</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Then, on top of that, we say we're only going to join the rows <em>if</em> the id in the first table <em>doesn't</em> match the id in the second table. So we're asking the question, "<strong>where are the rows with the same city but different vendors?</strong>" Or, another way to put that is, "<strong>what cities have multiple vendors?</strong>" Using <code>DISTINCT</code> (otherwise we would find a row in each of the two columns that met the conditions), what we end up with is a list of vendors that share a city.</p> 
      <div class="callout primary">Don't worry - self joins are very rare!</div>
    </div>
  </div>
</section>
<section id="syntaxVariations">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Syntax variations</h2>
      <p>The syntax we've gone over today is chosen to make it clear what we're doing, but, as usual with SQL, there are other ways to write things. Shorter or implicit syntax is risky with joins, as it's easy to write something you don't mean. Still, you'll need to recognize it if you come across it.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3>Inner join - implicit (a.k.a. non-ANSI) syntax</h3>
      <p>The implicit syntax for an inner join puts both tables in the <code>FROM</code> conditions, and uses <code>WHERE</code> in place of <code>ON</code></p>
      <pre><code class="language-sql">SELECT invoice_number, vendor_name
FROM vendors v, invoices i
WHERE v.vendor_id = i.vendor_id</code></pre>
      <h3>Outer join - implicit (a.k.a. non-ANSI) syntax</h3>
      <p>The implicit syntax for an outer join also puts both tables in the <code>FROM</code> conditions, and uses <code>WHERE</code> in place of <code>ON</code>. A plus symbol enclosed by parentheses (<code>(+)</code>) indicates the table whose data will be included beyond the join.</p>
      <pre><code class="language-sql">SELECT invoice_number, vendor_name
FROM invoices i, vendors v
WHERE i.vendor_id (+) = v.vendor_id</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3><code>USING</code></h3>
      <p>Using <code>USING</code> isn't necessarily bad practice - it's quite concise. But it doesn't have the flexibility of the <code>ON</code> clause, hence why we didn't cover it today. It is a shorthand for <code class="language-sql">ON table1.id = table2.id</code>.</p>
      <pre><code class="language-sql">SELECT invoice_number, vendor_name
FROM invoices JOIN vendors
USING (vendor_id)</code></pre>
      <h3><code>NATURAL</code></h3>
      <p><code>NATURAL</code>, however, <em>is</em> sloppy syntax, and should be avoided. It tells the database to <em>guess</em> what columns to join on. It only works if there is a single, identically named shared column. It's very poor for maintainability.</p>
      <pre><code class="language-sql">/* Shame! */
SELECT invoice_number, vendor_name
FROM invoices NATURAL JOIN vendors</code></pre>
    </div>
  </div>
</section>
<section class="post-only">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Run this script to follow along with the next section:</p>
      <pre><code class="language-sql">SET DEFINE OFF;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE current_students';
  EXECUTE IMMEDIATE 'DROP TABLE past_students';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE current_students
(
    name_first          VARCHAR(50)   NOT NULL,
    name_last     VARCHAR(50)   NOT NULL,
    grade_point_average   NUMBER(2,1),
    first_time_student    VARCHAR(10)   NOT NULL

);

CREATE TABLE past_students
(
    first_name           VARCHAR(50)   NOT NULL,
    last_name      VARCHAR(50)   NOT NULL,
    final_grade_point_average   NUMBER(2,1),
    graduated   VARCHAR(10)   NOT NULL
);

INSERT INTO current_students VALUES ('Tobe', 'Hooper', 3.1, 'true');
INSERT INTO current_students VALUES ('Wes', 'Craven', 3.2, 'true');
INSERT INTO current_students VALUES ('John', 'Carpenter', 3.3, 'true');
INSERT INTO current_students VALUES ('William', 'Castle', 1.9, 'false');
INSERT INTO past_students VALUES ('William', 'Friedkin', 3.4, 'true');
INSERT INTO past_students VALUES ('Ti', 'West', 3.5, 'true');
INSERT INTO past_students VALUES ('Adam', 'Wingard', 3.6, 'true');
INSERT INTO past_students VALUES ('William', 'Castle', 1.9, 'false');

COMMIT;</code></pre>  
    </div>
  </div>
</section>
<section id="other">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Other ways to 'join' table data <span class="post-only">(that aren't JOINs)</span></h2>
      <p>We're not going to dive into these today, but I want you to know about these things:</p>
      <h3 class="post-only">UNION</h3>
      <p>There is an operator called <code>UNION</code>. It's similar to a join, but it doesn't merge any rows. Instead it lets you add rows from multiple tables to a single results table. So, if you've got a table of current students, and a table of past students, you could do something like this:</p>
      <pre><code class="language-sql">SELECT 'current' AS status, 
name_first, name_last, grade_point_average
FROM current_students
UNION
SELECT 'graduated' as status, 
first_name, last_name, final_grade_point_average
FROM past_students
WHERE graduated = 'true'</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <div class="callout alert">Note that the columns from the two tables are treated as single columns in the results table, and need the same data type.</div>
      <p>There are operators that work very similarly - <code>MINUS</code> and <code>INTERSECT</code>. They are basically types of 'union', but <code>MINUS</code> eliminates any rows that occur twice (not just the duplicate, but the original as well), and <code>INTERSECT</code> is the opposite - only showing rows where the data appears in each table.</p>
      <div class="post-only">
        <h3>MINUS</h3>
        <pre><code class="language-sql">SELECT 
name_first, 
name_last, 
grade_point_average
FROM current_students
MINUS
SELECT first_name, last_name, final_grade_point_average
FROM past_students</code></pre>
        <h3>INTERSECT</h3>
        <pre><code class="language-sql">SELECT 
name_first, 
name_last, 
grade_point_average
FROM current_students
INTERSECT
SELECT first_name, last_name, final_grade_point_average
FROM past_students</code></pre>
      </div>
    </div>
  </div>
</section>
<section id="lab">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Lab time!</h2>
      <p>If you're done your lab before the end of class, you're welcome to start on your <a href="<%= site.basePath %>/assignments/assignment-2.html">second assignment</a>.</p>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Lab Questions</h2>
      <p>See <a href="<%= site.basePath %>/notes/week-2/index.html#lab" target="_blank">notes<span class="show-for-sr"> Opens in a new tab</span></a></p> 
    </div>
  </div>
</section>
<section class="post-only">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2>Lab Questions:</h2>
      <ol class="lab-questions">
        <li>Write a query that returns invoice_number, line_item_amt and line_item_description by joining invoice_line_items and invoices, where the credit total is non-zero. Use table aliases, but only where you need them.</li>
        <li>Write a query that returns the first name and zip code of anyone sharing a zip code with another customer from the customers table.</li>
        <li>Fully join order_details and orders. Sort the results so that any orders that haven't been recorded as shipped are at the top.</li>
        <li>Screenshot an ER diagram of 3 (only 3!) tables that are connected by defined relationships.</li>
      </ol>
    </div>
  </div>
</section>