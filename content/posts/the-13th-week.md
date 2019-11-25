---
title: "Week 12"
date: 2019-11-19T08:47:11+01:00
publishdate: 2020-11-19T08:47:11+01:00
today:
  -
    title: Pop Quiz!
    id: popQuiz
  -
    title: What to expect on the final
    id: final
  -
    title: Review
    id: review
---
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <div class="callout alert"><h2 class="h2">PLEASE DON'T READ AHEAD IN THE NOTES TODAY</h2></div>
    </div>
  </div>
</section>
<section id="popQuiz">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">This is not a quiz...</h2>
      <p>...in the sense that it is anonymous, and you will not be marked 😅</p>
      <p>This is just a chance for you to guage your own understanding, and for me to see how much of a "deep dive" we should do during our review.</p>
      <p>This is why I'm asking you to not read ahead in the notes - to get a 'clean' picture of what we need to focus on.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Please visit the <a href="http://etc.ch/MMAz" target="_blank">quiz page</a> and we'll get started.</p>
      <div class="callout warning">Be sure to choose the answer that is the <em>most</em> correct.</div>
    </div>
  </div>
</section>
<section id="final">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">What to expect on the final:</h2>
      <ul>
        <li>Architecture problems.</li>
        <li>Plain english problems.</li>
        <li>Debugging.</li>
        <li>Generic SQL (not a lot of Oracle- or MySQL-specific stuff).</li>
      </ul>
    </div>
  </div>
</section>
<!-- Trigger, Procedures, View, Functions -->
<section id="review">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Reviewing Procedures, Functions, Views and Triggers</h2>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3 class="h3">Procedures</h3>
      <p>Remember why we use stored procedures - to automate DML (<code>INSERT</code>, <code>UPDATE</code> and <code>DELETE</code>).</p>
      <p>Stored procedures are for <em>doing stuff</em> to the data.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <pre><code class="language-sql">CREATE OR REPLACE PROCEDURE [procedure name]
    ([parameter],[parameter])
AS
    [declare variables, cursors]
BEGIN
    [do IF statements, loops, DML stuff]
EXCEPTION
    [handle exceptions]
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3 class="h3">Functions</h3>
      <p>Remember why we use functions - to return values.</p>
      <p>Stored procedures are for <em>getting stuff</em> from the data.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <pre><code class="language-sql">CREATE OR REPLACE FUNCTION [function name]
    ([parameter],[parameter])
RETURN [data type]
AS
    [declare variables, cursors]
BEGIN
    [do IF statements, loops, SELECT stuff]
EXCEPTION
    [handle exceptions]
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3 class="h3">Triggers</h3>
      <p>Remember that triggers are procedures that get called automatically before or after a specified DML statement is run.</p>
      <p>These are useful for checking complicated constraints (before) or cleaning up data (after).</p>
      <div class="callout warning">Tip: create a trigger so that after you delete an object (like an invoice or employee), appropriate references to that object get deleted. This protects your database against 'orphan data'.</div>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <pre><code class="language-sql">CREATE OR REPLACE TRIGGER [trigger_name]
[BEFORE|AFTER] [INSERT|UPDATE|DELETE] ON [table_name]
FOR EACH ROW
DECLARE
  [declare stuff]
BEGIN
  [do stuff]
EXCEPTION
  [handle errors]
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3 class="h3">Views</h3>
      <p>Remember that views are stored SELECT statements, good for reducing complexity and granting access to specific users.</p>
      <pre><code class="language-sql">CREATE OR REPLACE VIEW [view name] AS
  [SELECT statement]</code></pre>
    </div>
  </div>
</section>
<!-- Cursors and sequences -->
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Reviewing cursors and sequences</h2>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3 class="h3">Cursors</h3>
      <p>Remember that cursors are collections of rows within the scope of a procedure or function (unlike views, which are database objects).</p>
      <p>We use a cursor when we want to do something to a table <em>one row at a time</em>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <pre><code class="language-sql">CREATE OR REPLACE PROCEDURE adjust_alignment AS
CURSOR char_cursor IS 
    SELECT character_id, primary_class, alignment 
    FROM characters
    WHERE LOWER(race) LIKE ('%dark elf%');
BEGIN
    FOR char_row IN char_cursor LOOP
        IF (char_row.alignment IS NULL) THEN
            UPDATE characters 
            SET alignment = char_row.alignment
            WHERE character_id = char_row.character_id;
        END IF;
    END LOOP;
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h3 class="h3">Sequences</h3>
      <p>Remember that sequences are a series of numbers that counts up every time you take a value from it.</p>
      <pre><code class="language-sql">CREATE SEQUENCE [sequence_name]
  MINVALUE [number]
  MAXVALUE [number]
  START WITH [number]
  INCREMENT BY [number]</code></pre>
    </div>
  </div>
</section>
<!-- Debug review -->
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Debugging</h2>
      <div class="callout primary">Remember your debugging steps!</div>
      <p>Look at following statements. Try to first recognize the errors <em>without</em> refering to your notes or running them in a DB client.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>The following has 3 syntax errors</p>
      <pre><code class="language-sql">CREATE OR REPLACE PROCEDURE adjust_alignment AS
CURSOR 
    SELECT character_id, primary_class, alignment 
    FROM characters
    WHERE LOWER(race) LIKE ('%dark elf%');
BEGIN
    FOR char_row IN char_cursor LOOP
        IF (char_row.alignment IS NULL) THEN
            UPDATE characters 
            alignment = char_row.alignment
            WHERE character_id = char_row.character_id;
    END LOOP;
    COMMIT;
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>The following has 3 syntax errors</p>
      <pre><code class="language-sql no-max">CREATE OR REPLACE PROCEDURE insert_into_employees
(
    id_param            bakery_employees.employee_id%TYPE,
    loc_param           bakery_employees.default_loc%TYPE,
    first_name_param    bakery_employees.first_name%TYPE,
    last_name_param     bakery_employees.last_name%TYPE,
    type_param          bakery_employees.employee_type%TYPE
)
BEGIN
    INSERT INTO bakery_employees VALUES (
      id_param, 
      loc_param, 
      last_name_param, 
      type_param
    );
    COMMIT;
EXCEPTION
    ROLLBACK;
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>The following has 3 syntax errors</p>
      <pre><code class="language-sql">CREATE OR REPLACE FUNCTION balance_due_func
(
  invoice_id_param 
)
RETURN NUMBER
AS
    balance_due_var NUMBER;
BEGIN

    SELECT invoice_total - payment_total - credit_total
    FROM invoices
    WHERE invoice_id = invoice_id_param;

    RETURN balance_due;
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>The following has 2 syntax errors</p>
      <pre><code class="language-sql">CREATE VIEW
AS
  SELECT first_name || ' ' || last_name AS name, address
  FROM bakery_employees JOIN bakery_locations
  ON location_id = location_id</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>The following has 2 syntax errors.</p>
      <pre><code class="language-sql">TRIGGER attrition
  AFTER DELETE bakery_employees
  FOR EACH ROW
BEGIN
  DELETE FROM bakery_shifts
  WHERE employee_id = OLD.employee_id
  COMMIT;
END;
/</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Architecture review</h2>
      <p>Remember the principles of relational databases!</p>
      <ol>
        <li>Data should be duplicated as little as possible.</li>
        <li>One to one relationships mean we have one too many tables.</li>
        <li>Many to many relationships mean we need a bridging table.</li>
        <li>One table for each type of entity (person, place, thing, event).</li>
        <li>One record (cell) for (maximum) 1 datum (piece of data).</li>
        <li>We maintain referential integrity with keys.</li>
        <li>We maintain data integrity with constraints.</li>
        <li>We maintain semantics with data types.</li>
      </ol>
    </div>
  </div>
</section>
<section id="archReview">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>For the purposes of the exam, it is more important that you understand the problem than it is to have functional code.</p>
      <p><strong>Complete each step</strong> before going on to the next step.</p>
      <ol>
        <li>Read through the review questions.</li>
        <li>For each review question, write a sentence or short paragraph about how you will solve the problem.</li>
        <li>For each review question, write pseudocode.</li>
        <li>For each review question, write the code as best as you can <em>without refering to the notes</em>.</li>
        <li>For each review question, try to get your code to run, refering to the notes and running your code in a client (SQLDeveloper, Dbeaver, etc.) as necessary.</li>
      </ol>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>You are creating a database for a library.</p>
      <p>Library patrons have library cards. They are used when patrons borrow books. Books can be borrowed for up to three weeks.</p>
      <p>Patrons are charged late fees when they do not return their books on time, unless the patrons 'renews' the book. They can renew the book for one week, up to two times. Late fees are 10 cents per business day.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Librarians need to call to remind patrons of overdue books.</p>
      <p>If late fees exceed 50% of the purchase price of the book, the full amount of the book is charged to the patron, and late fees stop accruing.</p>
      <p>Librarians need to be able to quickly search for books in the database, and provide recommendations based on author and genre.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Questions</h2>
      <ol>
        <li>How would you design the library's database tables?</li>
        <li>What would you use to calculate late fees?</li>
        <li>How would you handle renewals?</li>
        <li>How would you present the top 10 most borrowed books based on the genre of a patron's most recently borrow book?</li>
        <li>How would you prevent a patron from borrowing a book if they had outstanding late fees of more than one dollar?</li>
        <li>How would you generate a list of the names and phone numbers of patrons who had overdue books?</li>
        <li>How would you let a librarian waive a late fee?</li>
        <li>How would you see a patron's top three favourite genres?</li>
        <li>How would you delete a book entirely from the system?</li>
      </ol>
    </div>
  </div>
</section>
