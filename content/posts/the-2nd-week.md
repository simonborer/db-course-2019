---
title: "Week 2 - Accessing Data from Tables"
date: 2019-09-10T08:47:11+01:00
publishdate: 2019-09-02T08:47:11+01:00
summary: "This week we'll cover retrieving rows from a single table; implementing arithmetic statements; renaming columns in results; retrieving rows using comparison operators; using DISTINCT to eliminate duplicate rows; defining the logical operators AND, OR and NOT; retrieving rows using LIKE, BETWEEN, IN and IS NULL operators; sorting the result set using ORDER BY."
featured_image: rpg.jpg
---
<!-- 
TODO: Quiz
-->
<section>
    <h2 class="slide-only">Here's what we're going to do today:</h2>
    <div class="grid-x">
      <div class="cell large-10 large-offset-1">
        <ol class="toc">
            <li class="slide-only"><a href="#Quiz">Quiz!</a></li>
            <li><a href="#basics">Query basics review</a></li>
            <li><a href="#single">More single table query techniques</a></li>
            <li><a href="#scalar">Scalar functions</a></li>
        </ol>
      </div>
    </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Welcome back!</h2>
    </div>
  </div>
</section>
<section class="slide-only" id="#Quiz">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">This is going to be easy.</h2>
      <p>You get an automatic 50% on these quizzes - because they're also how I check attendance.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 post-section">
      <p>Let's play around with a new dataset today: <a download href="/files/bike-thefts.sql">bike-thefts.sql</a>.</p>
      <p>This data is from the <a href="http://data.torontopolice.on.ca/datasets/" target="_blank">Toronto Police Service Public Safety Data Portal<span class="show-for-sr"> Opens in a new tab</span></a>, and it refers to reports of bicycle theft from 2018-present.</p>
      <p>There are almost 4000 row of data, so it will take a minute to run.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Importing a script</h2>
      <p>We're going to import a script I've created - like we did last week.</p>
      <ol>
        <li>Start your MAMP server.</li>
        <li>Create a folder on your computer called "bikes".</li>
        <li>Move <code>bike-thefts.sql</code> into the "bikes" folder.</li>
        <li>In DBeaver, go to <kbd>File > Import</kbd> and select "Scripts" as your import wizard.</li>
        <li>Click <kbd>Next</kbd>.</li>
      </ol>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <figure><img src="/images/import-scripts.png" alt="Example of script wizard."><figcaption>Should look something like this.</figcaption></figure>
      <ol start="6">
        <li><em>Make sure your default connection is "MySQL - localhost".</em></li>
        <li>Click <kbd>Finish</kbd>.</li>
      </ol>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <figure><img src="/images/run-script.png" alt="DBeaver"><figcaption>Why do they make these buttons so small</figcaption></figure>
      <ol start="8">
        <li>After importing the script, find it in your DBeaver "Scripts" folder, and double click to bring it up in the editor.</li>
        <li>Click the (weirdly small and hard to recognize) <kbd>Execute SQL Script</kbd> button.</li>
      </ol>
      <div class="callout success post-only">If in doubt, hover your mouse over the button until the title comes up. Remember, a SQL statement is just that - a single idea. A SQL script is long with many different instructions - like a movie script!</div>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">One more tweak:</h2>
      <figure>
        <img src="/images/return.png" alt="DBeaver max results rows.">
        <figcaption>Since we're dealing with large amounts of data today, (and don't have to worry about our internet speed while working on our local machines), change the maximum number of results rows from the default 200 to 5000.</figcaption>
      </figure>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Test your import.</h2>
      <ol>
        <li>Right-click your "MySQL - localhost" connection and select "SQL Editor".</li>
        <li>Run the following query:  
          <pre class="slide-only"><code class="language-sql">select * from bikes.thefts</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">select * from bikes.thefts</textarea>
        </li>
      </ol>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>While that's happening, if everyone's on board, let's get a <a href="https://join.slack.com/t/dbcourse2019/shared_invite/enQtNzQ3OTUzODk2ODAzLWNiMzk4MGQ3MTViMGIzYTRiNzNiNjkzZWI2ZDQ3NDViMGI1YTUzMGQ4MmM3ZmYwMDM1Y2U0OWI5M2RiNmQ1M2U" target="_blank" rel="noopener">slack channel</a> together.</p> 
    </div>
  </div>
</section>
<!--
<section class="slide-only" id="lab">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Lessons from the lab</h2>
      <p>I've marked all your labs - you did really great!</p>
      <p>Even if I gave you 7/7, check out my comments on Blackboard.</p>
    </div>
  </div>
</section>
<section >
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 post-section">
      <h2 class="h2">Common mistakes from the lab:</h2>
      <p>A <code>SELECT</code> statement doesn't affect the table - it shows us results in a temporary "results" table.</p>
      <p><code><></code> means "not equal to".</p>
      <p><strong>Never use curly quotes</strong>. Even ASCII quotes (<code>"</code>) are only for identifiers (i.e. column names) and aren't required unless you're using a reserved word or using whitespace. <code>'</code> is for values like strings and dates.</p>
      <p>That's why we're going to submit labs and assignments as <strong>.txt</strong> or <strong>.sql</strong> files going forward.</p>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Homoglyphs</h2>
      <div class="h1">‐ ‑ ‒ – ﹘ ۔‎ ⁃ ˗ −➖ -</div>
      <p>Homoglyphs are characters that look the same or similar. To you and me, they're very hard to tell apart. To computers, they're entirely different symbols.</p>
      <p>Don't work in Word - use a text editor without formatting, and/or one that is specifically specialized for writing code. Word processing programs like word will replace your characters with ones they think are appropriate (like “curly quotes”).</p>
      <p>Here are some popular (and free-to-use) text editors:</p>
      <ul>
        <li><a target="_blank" href="https://www.sublimetext.com/3">Sublime Text <span class="show-for-sr">Opens in a new window</span></a></li>
        <li><a target="_blank" href="https://code.visualstudio.com/">VS Code <span class="show-for-sr">Opens in a new window</span></a></li>
        <li><a target="_blank" href="https://atom.io/">Atom <span class="show-for-sr">Opens in a new window</span></a></li>
        <li><a target="_blank" href="https://scotch.io/tutorials/getting-started-with-vim-an-interactive-guide">Vim <span class="show-for-sr">Opens in a new window</span></a></li>
      </ul>
    </div>
  </div>
</section>
 -->
<section id="basics">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 post-section">
      <h2 class="h2">Query Basics</h2>
      <ul>
        <li><code>SELECT</code> <em>What do we want?</em></li>
        <li><code>FROM</code> <em>Where's it going to come from?</em></li>
        <li><code>WHERE</code> <em>How do we filter it?</em></li>
        <li><code>ORDER BY</code> <em>How do we organize it?</em></li>
      </ul>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">SELECT basics</h2>
      <p><code>*</code> selects all rows.</p>
      <p><code>||</code> concatenates<sup>[1]</sup>.</p>
      <p>Single quotes let us use string literals.</p>
      <p><code>AS</code> creates an alias.</p>  
      <p><code>DISTINCT</code> eliminates duplicates.</p>
      <hr>
      <small>1. Remember to normalize your SQL by running the statement <code class="language-sql">SET sql_mode='ANSI';</code>, otherwise you'll need to wrap your values in the <code>CONCAT</code> function, i.e. <code>CONCAT('My', 'S', 'QL')</code></small>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">WHERE basics</h2>
      <p>We can use comparison operators (<code>=</code>, <code><></code>, <code>>=</code>, etc.) <em>Note that >, <, etc. can be used with letters as well as numbers.</em></p>
      <p>We can use arithmetic operators (<code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>).</p>
      <p>We can use logical operators <code>AND</code>, <code>OR</code>, <code>NOT</code>.</p>
      <p><code>IN</code> lets us check against a list.</p>  
      <p><code>BETWEEN</code> lets us specify a range (for alphanumeric characters).</p>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>From the <code>bikes.thefts</code> table, write a query that returns rows where the reported value of the bike was greater than $1000. Select the make, model and cost, and order by the cost.</p>
      <p>When you've got something that works, post it in slack.</p>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>From the <code>bikes.thefts</code> table, write a query that returns rows where the incident did NOT place in winter (December-March).</p>
      <p>When you've got something that works, post it in slack.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">ORDER BY basics</h2>
      <p><code>ORDER BY</code> lets us sort our table based on a specified column. We can specify more than one column (or an alias).</p>
      <p>We can use <code>ASC</code> and <code>DESC</code> to say whether we want our results in ascending or descending order.</p>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>From the <code>bikes.thefts</code> table, write a query that puts the reports in reverse chronological order.</p>
      <p>When you've got something that works, post it in slack.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">DISTINCT basics</h2>
      <p>The <code class="language-sql">DISTINCT</code> clause, placed after <code class="language-sql">SELECT</code> means our query only returns rows where the data in the selected column(s) are unique.</p>
      <p>We can select multiple rows, and <code class="language-sql">DISTINCT</code> will return rows where the <em>combination</em> of column data is unique.</p>
      <p><small><em>Note: If you try to <code class="language-sql">ORDER BY</code> a column that you haven't selected in a distinct select statement, you will get an error.</em></small></p>
    </div>
  </div>
</section>
<section class="grid-x">
  <div class="cell large-10 large-offset-1">
    <h2 class="h2">Example</h2>
    <p>A query that selects one example of each make of bicycle reported stolen.</p>
    <pre class="slide-only"><code class="language-sql">SELECT DISTINCT Bike_Make AS 'Make of Bicycle' 
FROM bikes.thefts ORDER BY Bike_Make</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="110" cols="50" class="post-only">SELECT DISTINCT Bike_Make 
  AS 'Make of Bicycle' 
FROM bikes.thefts ORDER BY Bike_Make</textarea>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>From the <code>bikes.thefts</code> table, write a query that that only selects one row for each unique location type per neighbourhood. Order it by neighbourhood.</p>
      <p>When you've got something that works, post it in slack.</p>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>From the <code>bikes.thefts</code> table, write a query that creates a column called <code>Reported on</code>. This column should combine four columns from the table in the format DayOfTheWeek, Month, Day, Year.</p>
      <p>When you've got something that works, post it in slack.</p>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>There's just a few more commands and concepts we're going to cover today, and you'll have mastered selecting from a single table! Next week we'll start to <code>JOIN</code> things.</p>  
    </div>
  </div>
</section>
<section id="single">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 post-section">
      <h2 class="h2">Today we'll look at:</h2>
      <ul>
          <li>the <code>DUAL</code> table</li>
          <li>order of operations</li>
          <li>the <code>OFFSET</code> clause</li>
          <li>the <code>IS NULL</code> condition</li>
          <li>the <code>LIKE</code> clause (and its operators <code>%</code> and <code>_</code>)</li>
          <li>a few quirks of the <code>ORDER BY</code> operator</li>
          <li>scalar functions: <code>SUBSTR()</code>, <code>SYSDATE()</code>, <code>ROUND()</code>, <code>CAST()</code>, <code>MOD()</code>, and more!</li>
        </ul>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>The dual table is a great place to futz around!</p>
      <p>We can create columns and values, and execute functions:</p>
      <pre class="slide-only"><code class="language-sql">SELECT 'test' AS test_string,
    10-7 AS test_calculation,
    SYSDATE() AS test_date
FROM dual</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="160" cols="50" class="post-only">SELECT 'test' AS test_string,
    10-7 AS test_calculation,
    SYSDATE() AS test_date
FROM dual</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">The DUAL table</h2>
      <p>The <code>DUAL</code> table is created automatically for every table, and is available to all users.</p>
      <p>In Oracle, we can't write an expression without specifying where the data is coming from. There are certain expressions we can write that don't require a table, so we use <code>DUAL</code> table as a kind of 'dummy' source.</p>
      <p>Try running this statement:</p>
      <pre class="slide-only"><code class="language-sql">SELECT 10 * 4 / 2 + 30 - 8 AS result 
FROM dual</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT 10 * 4 / 2 + 30 - 8 AS result 
FROM dual</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Order of operations</h2>
      <p><strong>BEDMAS</strong>: <strong>B</strong>rackets, <strong>E</strong>xponents, <strong>D</strong>ivision and <strong>M</strong>ultiplication, <strong>A</strong>ddition and <strong>S</strong>ubtraction.</p>
      <p>Try running this statement:</p>
      <pre class="slide-only"><code class="language-sql">SELECT 10 * 4 / (2 + 30) - 8 AS result</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">FROM dual</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>We can use brackets (parentheses) to affect the order of operations for our logical operators as well, so that these two statements:</p>
      <pre class="slide-only"><code class="language-sql">SELECT invoice_number
FROM ap.invoices
WHERE invoice_date > '01-MAY-14' OR invoice_total > 500 
  AND invoice_total - payment_total - credit_total > 0</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="140" cols="50" class="post-only">SELECT invoice_number
FROM ap.invoices
WHERE invoice_date > '01-MAY-14' OR invoice_total > 500 
  AND invoice_total - payment_total - credit_total > 0</textarea>
      <p><small><em>Is the invoice date after May 1st 2014? If not, is it true both that the invoice total more than five hundred, and the payments and credits don't eliminate the invoice total?</em></small></p>
      <p><small><em>Is it true that either the invoice date is after May 1st 2014, or the invoice is for more than 500? Is it also true that the payments and credits don't eliminate the invoice total?</em></small></p>
      <p>...produce different results.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Our way to limit results: LIMIT and OFFSET</h2>
      <p><code>LIMIT</code> is a clause that lets us declare what rows we want to return. <code>OFFSET</code> lets us declare at what row to begin.</p>  
      <p>We write our LIMIT clause after our ORDER BY. If we want to offset, we append the OFFSET clause to LIMIT.</p>
      <p>Our syntax is:</p>
      <pre><code class="language-sql">LIMIT <em>n</em> [OFFSET <em>n</em> ROWS]</code></pre>
      <p><strong>Example:</strong></p>
      <pre class="slide-only"><code class="language-sql">SELECT vendor_id
FROM ap.invoices
ORDER BY vendor_id
LIMIT 5 OFFSET 2</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="140" cols="50" class="post-only">SELECT vendor_id
FROM ap.invoices
ORDER BY vendor_id
LIMIT 5 OFFSET 2</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">IS NULL</h2>
      <p>This one is pretty straightforward - <code>IS NULL</code> and <code>IS NOT NULL</code> are conditions we can add to the <code>WHERE</code> clause to return results that are (or aren't) null.</p>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM ap.invoices
WHERE payment_date IS NULL</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT * FROM ap.invoices
WHERE payment_date IS NULL</textarea>
      <div class="callout alert">Remember that 0 is not null</div>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">LIKE and wildcards</h2>
      <p><code>LIKE</code> is a powerful search tool for finding strings that match a pattern.</p>
      <p>The <code>%</code> symbol matches zero or more characters.</p>
      <p>The <code>_</code> (underscore) symbol matches one character.</p>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM ap.vendors
WHERE vendor_address1 LIKE '%PO Box%'</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT * FROM ap.vendors
WHERE vendor_address1 LIKE '%PO Box%'</textarea>
      <pre class="slide-only"><code class="language-sql">SELECT DISTINCT vendor_state FROM ap.vendors
WHERE vendor_state LIKE '_A'</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT DISTINCT vendor_state FROM ap.vendors
WHERE vendor_state LIKE '_A'</textarea>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Let's try another one from the <code>bike theft</code> table.</p>
      <p>Write a query that shows a list of neighbourhoods with the word 'dale' in their name. Only one row per neighbourhood.</p>
      <p>When you've got something that works, post it in slack.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">A few more things about ORDER BY</h2>
      <p><code>ASC</code> and <code>DESC</code> are specific to a column, so the following two statements produce different results:</p>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM ap.invoices
ORDER BY vendor_id DESC, payment_total</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT * FROM ap.invoices
ORDER BY vendor_id DESC, payment_total</textarea>
      <small><em>Ordered by descending vendor_id, ascending payment_total.</em></small>
      <pre class="slide-only"><code class="language-sql">SELECT * FROM ap.invoices
ORDER BY vendor_id, payment_total DESC</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="70" cols="50" class="post-only">SELECT * FROM ap.invoices
ORDER BY vendor_id, payment_total DESC</textarea>
      <small><em>Ordered by ascending vendor_id, descending payment_total.</em></small>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>The order of precedence is...</p> 
      <ol>
         <li>special characters</li>
         <li>numbers</li>
         <li>capital letters</li>
         <li>lowercase letters</li>
         <li>(null)</li>
       </ol> 
       <div class="callout warning">As you'd expect, this order is reversed when descending.</div>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>As we talked about, you can order according to any column (except when using <code>DISTINCT</code>, in which case it can only be a column you've selected). Additionally, we can select by an alias created in our <code>SELECT</code>.</p>
      <p>We are also able to select using an expression, or with the column number.</p>
      <pre class="slide-only"><code class="language-sql">SELECT *
FROM ap.vendor_contacts
ORDER BY first_name || last_name</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="110" cols="50" class="post-only">SELECT *
FROM ap.vendor_contacts
ORDER BY first_name || last_name</textarea>
      <pre class="slide-only"><code class="language-sql">SELECT *
FROM ap.vendor_contacts
ORDER BY 3,2</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="110" cols="50" class="post-only">SELECT *
FROM ap.vendor_contacts
ORDER BY 3,2</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Wait, isn't that just 2 different ways of writing <small><code class="language-sql">ORDER BY first_name, last_name</code></small>?</h2>
      <p>Yep! SQL is pretty generous in terms of how to accomplish things. Which is not to say you should be writing things three different ways if you don't need to - just a) that you should be able to read alternate methods when you come across them, and b) you know that you have options if you're in a situation where one method works better than another.</p>  
    </div>
  </div>
</section>
<section id="scalar">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 post-section">
      <h2 class="h2">Scalar functions</h2>
      <p>Scalar functions are predefined functions that operate on a single value. Later, we'll learn about <em>aggregate</em> functions, that can do things like sum an entire column, but for now, the functions we're working with will both consume and return a single datapoint.</p>
      <div class="callout primary">In mathematics, <em>scalar</em> is defined as <q>having magnitude, but not direction.</q></div>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Let's try one</h2>
      <p>Let's try the <code>ROUND()</code> function.</p>
      <pre class="slide-only"><code class="language-sql">SELECT invoice_total AS with_cents, 
  ROUND(invoice_total) as no_cents
FROM ap.invoices</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="110" cols="50" class="post-only">SELECT invoice_total AS with_cents, 
  ROUND(invoice_total) as no_cents
FROM ap.invoices</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">SUBSTR</h2>
      <p>The <code>SUBSTR()</code> function takes 3 arguments - <strong>string</strong>, <strong>position</strong>, and <strong>length</strong>.</p>
      <p>If we want a column featuring the vendors initials, we would format that as follows:</p> 
      <pre class="slide-only"><code class="language-sql">SELECT last_name, first_name, 
  SUBSTR(first_name, 1, 1) || SUBSTR(last_name, 1, 1) AS initials
FROM ap.vendor_contacts</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="200" cols="50" class="post-only">SELECT 
  last_name, 
  first_name, 
  SUBSTR(first_name, 1, 1) || SUBSTR(last_name, 1, 1) 
  AS initials
FROM ap.vendor_contacts</textarea>
      <div class="callout primary"><code>SUBSTR</code> can count backwards! Use a negative position value to count back from the end of a string.</div>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Scalar functions are nestable</h2>
      <p>I know what you're thinking, "What if I want to know what the <em>last</em> letters in their names are?"</p>
      <pre class="slide-only"><code class="language-sql">SELECT 
    last_name, 
    first_name, 
    UPPER(SUBSTR(REVERSE(first_name), 1, 1)) || 
        UPPER(SUBSTR(REVERSE(last_name), 1, 1)) 
    AS last_initials
FROM ap.vendor_contacts</code></pre>
          <textarea data-code-mirror="sql" data-code-mirror-height="220" cols="50" class="post-only">SELECT 
    last_name, 
    first_name, 
    UPPER(SUBSTR(REVERSE(first_name), 1, 1)) || 
        UPPER(SUBSTR(REVERSE(last_name), 1, 1)) 
    AS last_initials
FROM ap.vendor_contacts</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x slide-only">
    <div class="cell large-10 large-offset-1">
      <p>See the notes for a handy cheat sheet of (nearly) all the scalar functions.</p>
    </div>
  </div>
  <div class="grid-x post-only">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">There are a <em>ton</em> of these functions.</h2>
      <table>
        <thead>
          <tr>
            <th colspan="4" class="text-center">Scalar functions cheat sheet</th>
          </tr>
          <tr>
            <th>Name</th>
            <th>Example</th>
            <th>Example result</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Concatenate</td>
            <td><code class="language-sql">CONCAT('Hawkins' , 'High')</code></td>
            <td>HawkinsHigh</td>
            <td>Returns concatenated strings</td>
          </tr>
          <tr>
            <td>In String</td>
            <td><code class="language-sql">INSTR('Demodogs' , 'dog')</code></td>
            <td>5</td>
            <td>Returns the location of a substring in a string</td>
          </tr>
          <tr>
            <td>Length</td>
            <td><code class="language-sql">LENGTH('Mornings are for coffee and contemplation')</code></td>
            <td>41</td>
            <td>Returns the number of characters</td>
          </tr>
          <tr>
            <td>Right trim</td>
            <td><code class="language-sql">RTRIM(' MKULTRA    ')</code></td>
            <td>' MKULTRA'</td>
            <td>Trims trailing whitespace</td>
          </tr>
          <tr>
            <td>Left trim</td>
            <td><code class="language-sql">LTRIM(' MKULTRA    ')</code></td>
            <td>'MKULTRA    '</td>
            <td>Trims initial whitespace</td>
          </tr>
          <tr>
            <td>Replace</td>
            <td><code class="language-sql">REPLACE('High score: DUSTIN' , 'DUSTIN' , 'MADMAX')</code></td>
            <td>High score: MADMAX</td>
            <td>Replaces all of one string value with another.</td>
          </tr>
          <tr>
            <td>Reverse</td>
            <td><code class="language-sql">REVERSE('The Upsidedown')</code></td>
            <td>nwodedispU ehT</td>
            <td>Reverses a string</td>
          </tr>
          <tr>
            <td>Lowercase</td>
            <td><code class="language-sql">LOWER('RAINBOW ROOM')</code></td>
            <td>rainbow room</td>
            <td>Converts string to lowercase</td>
          </tr>
          <tr>
            <td>Uppercase</td>
            <td><code class="language-sql">UPPER('Why are you keeping this curiosity door locked?')</code></td>
            <td>WHY ARE YOU KEEPING THIS CURIOSITY DOOR LOCKED?</td>
            <td>Converts string to uppercase</td>
          </tr>
          <tr>
            <td>Add dates</td>
            <td><code class="language-sql">DATE_ADD('2019-9-15' , INTERVAL 15 DAY)</code></td>
            <td>2019-09-30</td>
            <td>Adds interval to date.</td>
          </tr>
          <tr>
            <td>Extract</td>
            <td><code class="language-sql">EXTRACT (MONTH FROM SYSDATE())</code></td>
            <td>9</td>
            <td>Returns the value of a specified date.</td>
          </tr>
          <tr>
            <td>Last day of the month</td>
            <td><code class="language-sql">LAST_DAY('2019-09-12')</code></td>
            <td>'2019-09-30'</td>
            <td>Returns a date representing the last day of the month for specified date. </td>
          </tr>
          <tr>
            <td>System date</td>
            <td><code class="language-sql">SYSDATE()</code></td>
            <td>2019-09-13-12.29.09 -0400</td>
            <td>Returns the current database system date.</td>
          </tr>
          <tr>
            <td>Truncate</td>
            <td><code class="language-sql">TRUNCATE(59.9, 0)</code></td>
            <td>59</td>
            <td>Rounds down the first value to the decimal place provided in the second value.</td>
          </tr>
          <tr>
            <td>Ceiling</td>
            <td><code class="language-sql">CEIL(59.1)</code></td>
            <td>60</td>
            <td>Rounds up to the nearest integer</td>
          </tr>
          <tr>
            <td>Modulus</td>
            <td><code class="language-sql">MOD(12,5)</code></td>
            <td>2</td>
            <td>Returns the modulus (remainder) of two values</td>
          </tr>
          <tr>
            <td>Cast</td>
            <td><code class="language-sql">CAST(1506 AS CHAR)</code></td>
            <td>The string value '1506'</td>
            <td>Convert datatype</td>
          </tr>
          <tr>
            <td>Coalesce</td>
            <td><code class="language-sql">COALESCE(NULL,'Will Byers')</code></td>
            <td>Will Byers</td>
            <td>Replaces null values with specified value.</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section id="lab">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Lab time!</h2>
    </div>
  </div>
</section>
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Lab Questions</h2>
      <p>See <a href="<%= site.basePath %>/notes/week-1/index.html#lab" target="_blank">notes<span class="show-for-sr"> Opens in a new tab</span></a></p> 
    </div>
  </div>
</section>
<section class="post-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2>Lab Questions:</h2>
      <ol class="lab-questions">
        <li>Write a query to display the vendor id, vendor name, vendor city and vendor state.  Only display vendors located in the following states: MI, OH, PA, NV, and TN.  Only display rows where the vendor city begins with either the letter C or the letter A.  The results are to be sorted first on the vendor state then by vendor city within the state.</li>
        <li>Write a query that will display the vendor name, vendor_address1, vendor city, vendor state.  Only display vendors where the vendor_address1 contains the text PO Box in any format (check the data first to see how PO box is written) in the vendor state of CA.  The results are to be displayed in descending sequence on the vendor name.</li>
        <li>Write a query to show which vendors do not have a phone number.  Display the vendor name, vendor contact last name, and vendor contact first name and vendor phone.  Display the rows under vendor phone so it displays as N/A.  The results are to be displayed in sequence by the vendor’s last name then by the vendor’s first name both in ascending sequence.</li>
        <li>Write a query to display the vendor id, invoice total, payment total, and payment date.  Only show records where the invoice total is greater than 10,000.  Also only show records where the payment date has no value.  Display the results in ascending sequence based on invoice total.</li>
        <li>Write a query to display the invoice number, vendor id, invoice date, the result of invoice total minus payment total plus credit total.  Add payment total and credit total first then subtract from invoice total, display the results using an alias called Balance Due.  Only display records from May of '14 or April of '14 where the result of Balance Due is not equal to zero.  Display the results in ascending sequence on Balance Due (or the calculation of that column).</li>
      </ol> 
      <div class="callout alert">These ones are hard! There are a few trick questions. Be sure to go back to the notes.</div>
    </div>
  </div>
</section>