---
title: "Week 5 - Tables; Numeric Data; NVL"
date: 2019-10-01T08:47:11+01:00
publishdate: 2019-09-02T08:47:11+01:00
featured_image: space-time.jpg
summary: "This week we'll cover how to create a test table; insert new data to a table; update existing data; delete data from a table; work with date/time data; various data types used in Oracle; functions for working with numeric data; functions for working with null data values; nvl and nvl2; converting data from one type to another."
today:
  -
    title: Lessons from the lab
    id: labLessons
  -
    title: Creating tables
    id: creatingTables
  -
    title: Constraints
    id: constraints
  -
    title: Alter
    id: alter
  -
    title: Lab
    id: lab
---
<!-- <% const today = page.today %>

<section>
  <h2 class="slide-only">Here's what we're going today</h2>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <ol class="toc">
      <% today.forEach(item => { %>
      	<li><a href="#<%= item.id %>"><%= item.title %></a></li>
      <% }) %>
      </ol>
    </div>
  </div>
</section> -->
<section class="slide-only">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Happy Monday!</h2>
    </div>
  </div>
</section>
<section id="<%- page.today[0].id %>">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2"><%- page.today[0].title %></h2>
      <p>You did pretty ok on the lab!</p>
      <p>It was definitely a challenge, but I was still impressed. I marked it out of 7, and was pretty forgiving with things like syntax, and whether your queries actually, you know, worked.</p>
      <p>Thank you for fighting through it, and I'm going to give you a little reward for your hard work.</p>
      <p>Let's review...</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 1</h2>
      <p>Write a statement to return the average time<del>, rounded off to two decimal places,</del> of vehicle thefts <del>for each month. Only include occurrences between 2014 and 2017. Order the results from the latest time of day to the earliest.</del></p>
      <pre><code class="language-sql">SELECT AVG(occurrencehour)
FROM autotheft</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement to return the average time, rounded off to two decimal places, of vehicle thefts <del>for each month</del>. Only include occurrences between 2014 and 2017. Order the results from the latest time of day to the earliest.</p>
      <pre><code class="language-sql">SELECT ROUND(AVG(occurrencehour), 2) AS time_of_day
FROM autotheft
WHERE occurrenceyear BETWEEN 2014 AND 2017
ORDER BY time_of_day DESC</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement to return the average time, rounded off to two decimal places, of vehicle thefts for each month. Only include occurrences between 2014 and 2017. Order the results from the latest time of day to the earliest.</p>
      <pre><code class="language-sql">SELECT occurrencemonth, 
    ROUND(AVG(occurrencehour), 2) AS time_of_day
FROM autotheft
WHERE occurrenceyear BETWEEN 2014 AND 2017
GROUP BY occurrencemonth
ORDER BY time_of_day DESC</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 2</h2>
      <p>Write a statement that shows a list of premises types<del> with more than 500 total thefts</del>.</p>
      <pre><code class="language-sql">SELECT DISTINCT premisetype
FROM autotheft</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that shows a list of premises types with more than 500 total thefts.</p>
      <pre><code class="language-sql">SELECT premisetype, COUNT(*) 
FROM autotheft
GROUP BY premisetype
HAVING COUNT(*) > 500</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 3</h2>
      <p>Write a statement that returns the oldest <del>incident</del> from this dataset.</p>
      <pre><code class="language-sql">SELECT MIN(occurrencedate) 
FROM autotheft</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that returns the oldest incident from this dataset.</p>
      <pre><code class="language-sql">SELECT event_unique_id, occurrencedate
FROM autotheft
WHERE occurrencedate = (
    SELECT MIN(occurrencedate) FROM autotheft
    )
FETCH FIRST 1 ROW ONLY</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 4</h2>
      <p>Write a statement that returns <del>the top</del> 10 neighbourhoods <del>that had the most reported thefts in 2017</del>.</p>
      <pre><code class="language-sql">SELECT neighbourhood
FROM autotheft
FETCH FIRST 10 ROWS ONLY</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that returns the top 10 neighbourhoods that had the most reported thefts <del>in 2017</del>.</p>
      <pre><code class="language-sql">SELECT neighbourhood, COUNT(*) AS incidents 
FROM autotheft
GROUP BY neighbourhood
ORDER BY incidents DESC
FETCH FIRST 10 ROWS ONLY</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that returns the top 10 neighbourhoods that had the most reported thefts in 2017.</p>
      <pre><code class="language-sql">SELECT neighbourhood, COUNT(*) AS incidents 
FROM autotheft
WHERE reportedyear = 2017
GROUP BY neighbourhood
ORDER BY incidents DESC
FETCH FIRST 10 ROWS ONLY</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 5</h2>
      <p>Write a statement that returns the top 5 neighbourhoods in terms of thefts (in any year)<del>, and a column that shows how many incidents they had above the average neighbourhood</del>.</p>
      <pre><code class="language-sql">SELECT neighbourhood, COUNT(*)
FROM autotheft
GROUP BY neighbourhood
ORDER BY COUNT(*) DESC
FETCH FIRST 5 ROW ONLY</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that returns the <del>top 5 neighbourhoods in terms of thefts (in any year), and a column that shows how many incidents they had above the </del>average neighbourhood.</p>
      <pre><code class="language-sql">SELECT AVG(COUNT(*))
        FROM autotheft
        GROUP BY neighbourhood</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that returns the top 5 neighbourhoods in terms of thefts (in any year), and a column that shows how many incidents they had above the average neighbourhood.</p>
      <pre><code class="language-sql">SELECT neighbourhood, COUNT(*),
    COUNT(*) - (
        SELECT AVG(COUNT(*))
        FROM autotheft
        GROUP BY neighbourhood
    ) AS "More than average" 
FROM autotheft
GROUP BY neighbourhood
ORDER BY "More than average" DESC
FETCH FIRST 5 ROW ONLY</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 6</h2>
      <p>Write a statement to insert your own character in the characters_copy table<del>, with no null values. Give yourself the most hitpoints of any character (but only by one)</del>.</p>
      <pre><code class="language-sql">INSERT INTO characters_copy (character_id)
VALUES ('34567')</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement to insert your own character in the characters_copy table<del>, with no null values</del>. Give yourself the most hitpoints of any character (but only by one).</p>
      <pre><code class="language-sql">SELECT MAX(hitpoints) FROM characters_copy</code></pre>
      <pre><code class="language-sql">INSERT INTO characters_copy (character_id, hitpoints)
VALUES ('34567', 285)</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement to insert your own character in the characters_copy table<del>, with no null values</del>. Give yourself the most hitpoints of any character (but only by one).</p>
      <pre><code class="language-sql">SELECT MAX(hitpoints) FROM characters_copy</code></pre>
      <pre><code class="language-sql">INSERT INTO characters_copy (character_id, hitpoints)
VALUES ('34567', (
  SELECT MAX(hitpoints) + 1 FROM characters_copy)
)</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement to insert your own character in the characters_copy table, with no null values. Give yourself the most hitpoints of any character (but only by one).</p>
      <pre><code class="language-sql">SELECT MAX(hitpoints) FROM characters_copy</code></pre>
      <pre><code class="language-sql">INSERT INTO characters_copy (
    character_id, race, background, primary_class,
    subclass, char_level, feats, hitpoints, armour_class, 
    strength, dexterity, constitution, intelligence, wisdom, 
    charisma, alignment, skills, weapons, spells
)
VALUES (
  '34567', 'Half-Elf', 'Sailor', 'Druid', 'Circle of the Shepherd', 
  9, 'Linguist', (
    SELECT MAX(hitpoints) + 1 FROM characters_copy
  ), 20, 24, 16, 24, 22, 24, 20, 'chaotic good', 'Stealth', 
  'Longbow', 'Tree Stride'
)</code></pre> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 7</h2>
      <p>Wait, that looks suspicious. Write a statement to update your character so that you've got the fourth highest hitpoints.</p>
      <pre><code class="language-sql">SELECT hitpoints FROM characters_copy
WHERE character_id <> '34567'
ORDER BY hitpoints DESC
FETCH FIRST 4 ROWS WITH TIES</code></pre> 
<pre><code class="language-sql">UPDATE characters_copy SET hitpoints='259'
WHERE character_id='34567'</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
<pre><code class="language-sql">UPDATE characters_copy SET hitpoints=(
    SELECT hitpoints FROM characters_copy
    ORDER BY hitpoints DESC
    OFFSET 2 ROWS
    FETCH NEXT 1 ROW ONLY
) - 1
WHERE character_id='34567'</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 8</h2>
      <p>Get a list of all the subclasses <del>that are schools and are associated with a character whose constitution stat is an even number</del>.</p>
      <pre><code class="language-sql">SELECT DISTINCT subclass FROM characters_copy</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Get a list of all the subclasses that are schools <del>and are associated with a character whose constitution stat is an even number</del>.</p>
      <pre><code class="language-sql">SELECT DISTINCT subclass 
FROM characters_copy
WHERE UPPER(subclass) LIKE ('%SCHOOL%')
</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Get a list of all the subclasses that are schools and are associated with a character whose constitution stat is an even number.</p>
      <pre><code class="language-sql">SELECT DISTINCT subclass 
FROM characters_copy
WHERE MOD(constitution, 2) = 0 
  AND UPPER(subclass) LIKE ('%SCHOOL%')
</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Question 8</h2>
      <p>Write a statement that returns the earliest invoice for each line item description<del>, provided that the line item description begins with a letter in the first half of the alphabet, and the vendor's last name ends with a letter in the second half of the alphabet</del>.</p>
      <pre><code class="language-sql">SELECT line_item_description, MIN(invoice_date) 
FROM invoices 
JOIN invoice_line_items
USING(invoice_id)
GROUP BY line_item_description
</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that returns the earliest invoice for each line item description, provided that the line item description begins with a letter in the first half of the alphabet<del>, and the vendor's last name ends with a letter in the second half of the alphabet</del>.</p>
      <pre><code class="language-sql">SELECT line_item_description, MIN(invoice_date) 
FROM invoices 
JOIN invoice_line_items
USING(invoice_id)
GROUP BY line_item_description
HAVING line_item_description BETWEEN 'A' AND 'M' 
ORDER BY line_item_description
</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Write a statement that returns the earliest invoice for each line item description, provided that the line item description begins with a letter in the first half of the alphabet, and the vendor's last name ends with a letter in the second half of the alphabet.</p>
      <pre><code class="language-sql">SELECT line_item_description, MIN(invoice_date) FROM invoices 
JOIN invoice_line_items
USING(invoice_id)
JOIN vendors
USING(vendor_id)
WHERE 
  UPPER(SUBSTR(vendor_contact_last_name, -1, 1)) BETWEEN 'N' AND 'Z'
GROUP BY line_item_description
HAVING line_item_description BETWEEN 'A' AND 'M' 
ORDER BY line_item_description
</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Your reward</h2>
      <p>I made you a <a href="<%= basePath %>/notes/week-4/cheatsheet.html" target="_blank">cheat sheet</a></p>  
    </div>
  </div>
</section>
<section id="<%= page.today[1].id %>">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">So you want to create a table...</h2>
      <p>As you go to make your first tables from scratch, a few things to know/remember:</p>
      <ul>
        <li>Each cell should contain no more than one piece of data</li>
        <li>Columns are for categories of data</li>
        <li>Rows are for instances of data</li>
        <li>Tables can only be created in a db if you have permission (don't worry - you do!)</li>
      </ul>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Designing your table - the basics</h2>
      <p>For each column, you'll need to decide the following:</p>  <ul>
        <li>The name of the column</li>
        <li>The data type</li>
        <li>Whether to set a default</li>
        <li>Whether to allow <code>null</code></li>
      </ul>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Column names...</p>
      <ul>
        <li>Must be <em>no more than </em>30 characters</li>
        <li>Must start with a letter [A-Za-z]</li>
        <li>Can include numbers, underscore, or hash (#)</li>
        <li>Can<em>not</em> include whitespace</li>
        <li>Must be unique for the user+database</li>
        <li>Can<em>not</em> be reserved words</li>
      </ul>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Let's look at this code:</p>
      <pre><code class="language-sql">CREATE TABLE new_students
(
  student_id  NUMBER(6)     PRIMARY KEY,
  last_name   VARCHAR2(15)  NOT NULL,
  first_name  VARCHAR2(15),
  gpa         NUMERIC(3, 2)
)</code></pre>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Okay, now let's populate our table.</p>
      <p>Let's find the errors in these rows so we can insert them.</p>
      <pre><code class="language-sql">INSERT INTO new_students
VALUES(123, 'Voorhees', 'Jason', 234.43);
INSERT INTO new_students
VALUES(122, 'Myers', 'Michael', 'W', 1.9);
INSERT INTO new_students
VALUES(123, 'Kreuger', 'Freddy', 3.8);
INSERT INTO new_students
VALUES(124, null, 'Chucky', 3.4);</code></pre>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>The errors we just cleared were created by the <em>constraints</em> we made when creating the table.</p>  
    </div>
  </div>
</section>
<section id="<%= page.today[2].id %>">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Constraints are:</p>
      <ul>
        <li>Primary key (both <code>UNIQUE</code> and <code>NOT NULL</code>)</li>
        <li>Foreign key (must match the value in another table)</li>
        <li>UNIQUE</li>
        <li>NOT NULL</li>
        <li>CHECK (a condition, written as we would a <code>WHERE</code> statement)</li>
      </ul>
      <p>Also a kind of constraint (but we don't call it that):</p>
      <ul>
        <li>The datatype (including the size and other parameters)</li>
      </ul>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">The foreign key constraint</h2>
      <pre><code class="language-sql">CREATE TABLE work_placements
(
  placement_id  NUMBER(6)     PRIMARY KEY,
  student       NUMBER(6)     REFERENCES new_students(student_id),
  country       VARCHAR2(20)  DEFAULT 'Canada'
  name          VARCHAR2(15)
)</code></pre>
      <p>The syntax for creating a foreign key constraint is <code class="language-sql">REFERENCES {table}({columnName})</code></p>
      <p class="callout alert">If you try to create a foreign key constraint with an incompatible datatype, you'll get an error.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Try this:</p>
      <pre><code class="language-sql">INSERT INTO work_placements
VALUES(123, 120, DEFAULT, 'Crystal Lake');</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Once you've cleared the error, run <code class="language-sql">SELECT * FROM work_placements</code></p>
      <p>Note the value in the country column. We didn't insert that - how did it get there?</p>  
      <p class="callout primary">Try using DEFAULT with SYSDATE - it can come in really handy!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Oracle actually keeps track of all our constraints. We can query them!</p>
      <pre><code class="language-sql">SELECT constraint_name, constraint_type, status 
FROM user_constraints 
WHERE table_name = UPPER('work_placements')</code></pre>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Our constraints are given generated names by Oracle.</p>
      <p>However, Oracle isn't very good at naming things, so let's name them ourselves!</p>
      <p>A good naming conventions is [table_name]_[column_name]_[constraint_shortform]</p>
      <table><thead>
        <tr>
          <th>Constraint</th>
          <th>Shortform</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Primary Key</td>
          <td>pk</td>
        </tr>
        <tr>
          <td>Foreign Key</td>
          <td>fk</td>
        </tr>
        <tr>
          <td>Unique</td>
          <td>uk</td>
        </tr>
        <tr>
          <td>Check</td>
          <td>ck</td>
        </tr>
        <tr>
          <td>Not null</td>
          <td>nn</td>
        </tr>
      </tbody></table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p>Let's try naming our constraints!</p>
      <pre><code class="language-sql">DROP TABLE work_placements;
CREATE TABLE work_placements (
  placement_id  NUMBER(6)     
    CONSTRAINT work_placements_placement_id_pk PRIMARY KEY,
  student       NUMBER(6)     
    CONSTRAINT work_placements_student_fk REFERENCES new_students(student_id),
  country       VARCHAR2(20)  
    DEFAULT 'Canada',
  name          VARCHAR2(15)  
    CONSTRAINT work_placements_name_ck CHECK (SUBSTR(name, 1, 1) BETWEEN 'A' AND 'M')
);
SELECT * FROM user_constraints WHERE table_name = UPPER('work_placements');</code></pre>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <p><strong>Q: Can you define more than one primary key?</strong></p>
      <p>A: Yes! They're often used with 'bridging' tables that are created to resolve many-to-many relationships.</p>
      <p><strong>Q: Can you add or otherwise change the constraints to an existing table?</strong></p>
      <p>A: Yup! Just use the <code>ALTER TABLE</code> command. <code class="language-sql">ALTER TABLE {tableName} ADD CONSTRAINT {constraintName} {constraint}</code>.</p>
      <p><strong>Q: Can I specify that if the row referenced by a foreign key is deleted, that should also drop the with the foreign key?</strong></p>
      <p>A: Yes, but that's a bold move! You can add the command <code class="language-sql">ON DELETE CASCADE</code> to your constraint definition, like this: <code class="language-sql">CONSTRAINT work_placements_student_fk REFERENCES new_students(student_id) ON DELETE CASCADE</code></p>  
    </div>
  </div>
</section>
<section id="<%= page.today[3].id %>">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">ALTER TABLE</h2>
      <p>We can alter our tables in a number of ways.</p>
      <pre><code class="language-sql">ALTER TABLE work_placements
DROP CONSTRAINT work_placements_name_ck</code></pre>
      <p>In addition to adding and dropping, you can also <code>ENABLE</code> and <code>DISABLE</code> them.</p>
      <pre><code class="language-sql">ALTER TABLE
ADD {columnName} {dataType}</code></pre>
      <pre><code class="language-sql">ALTER TABLE
DROP COLUMN {columnName}</code></pre>
      <pre><code class="language-sql">ALTER TABLE
MODIFY COLUMN {columnName} {dataType|attribute}</code></pre>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Other commands that change tables</h2>
      <pre><code class="language-sql">DROP TABLE {tableName}</code></pre>
      <pre><code class="language-sql">RENAME TABLE {tableName} TO {newName}</code></pre>
      <pre><code class="language-sql">TRUNCATE TABLE {tableName}
-- drops the data, but not the table structure</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Indexing</h2>
      <p>Indices are a tool that Oracle uses to speed up queries. Great for large databases. Probably unnecessary for anything we're working with in class. Plus, they're automatically created for primary and foreign keys.</p>
      <p><em>That being said</em>, if you want to create one for a column that is going to be accessed a lot, here's how you do it:</p>
      <pre><code class="language-sql">CREATE INDEX new_students_last_name_ix
ON new_students(last_name)</code></pre>  
    </div>
  </div>
</section>
<section id="<%= page.today[4].id %>">
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1">
      <h2 class="h2">Lab time!</h2>
      <ol>
        <li>Create 3 tables. Each should have a primary key, and a foreign key that references one of your other tables' primary key. Each should have 4 columns. Use 4 different data types. Use at least 2 kinds of constraint besides primary and foreign keys. Use at least 1 default value.</li>
        <li>Insert at least 3 rows of data into each table.</li>
        <li>Write a statement that does a FULL JOIN on all three tables.</li>
        <li>Add a column to one of your tables.</li>
        <li>Rename one of your tables.</li>
      </ol>
    </div>
  </div>
</section>