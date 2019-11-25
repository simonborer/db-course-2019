---
title: "Week 9 - State of DB; Final Review"
date: 2019-10-29T08:47:11+01:00
publishdate: 2019-11-02T08:47:11+01:00
featured_image: 2019.png
summary: "This week we'll cover the state of databases in 2019, and review the top requested subjects."
---
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Happy Monday!</h2>
    </div>
  </div>
</section>
<section>
    <h2 class="slide-only">Here's what we're going to do today:</h2>
    <div class="grid-x">
      <div class="cell large-10 large-offset-1">
        <ol class="toc">
            <li class="slide-only"><a href="#Quiz">Quiz!</a></li>
            <li><a href="#2019">Databases in 2019</a></li>
            <li><a href="#review">Review topics</a></li>
        </ol>
      </div>
    </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>I've been warned against giving you a shallow knowledge of many subjects.</p>
      <p>Instead, today I'll give you an <em>extremely</em> shallow understanding.</p>
    </div>
  </div>
</section>
<section id="2018">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">The state of the <code>UNION</code></h2>
      <h3 class="h3">-- Databases in 2019 --</h3>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>In 2019, MySQL is the DBMS used by most developers<sup><a target="_blank" href="https://insights.stackoverflow.com/survey/2019#technology-_-databases">2</a></sup>.</p>
      <img style="max-height:50vh;" src="/images/use.png" alt="Stackoverflow developer survey" />
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>In 2019, the #1 most frequently discussed database management system is Oracle<sup><a target="_blank" href="https://db-engines.com/en/ranking">1</a></sup>.</p>
      <img src="/images/discussion.png" alt="Rankings from db-engines.com" />
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Postgres gained the most market share since last year<sup><a target="_blank" href="https://insights.stackoverflow.com/survey/2018#technology-_-databases">3</a></sup>, and is now the #2 most-used DBMS overall.</p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p><em><strong>Note:</strong> I strongly encourage you to check out the entire <a target="_blank" href="https://insights.stackoverflow.com/survey/2019">Stack Overflow Developer survey</a>. It will give you a lot of insight into the community you're joining, including things like demographics, job turnover, gender equality, salary, etc.</em></p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>NoSQL ("Not only SQL") databases tried to offer an alternative to relational database architecture by using key/value stores, documents or other "flat" architectures instead of tables. While this was a strong industry trend for a few years, in 2017 and 2018 adoption flattened or fell slightly.</p>
      <p>The consensus seems to be that NoSQL is a good supplemental tool for vertical scalability and rapid iteration, rather than a replacement for relational databases.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>For example, if you think your data structures will change while you're working on a project, and you're not sure <em>how</em> they will change, a document-based NoSQL db might be a good choice.</p>
      <p>If your primary concern is high-speed caching of data, a key-value store db like <a href="https://redis.io/topics/introduction" target="_blank">Redis</a> might be the best choice.</p>
      <p>If you're dealing with huge chunks of inconsistently structured data, you might need a wide column store db like <a href="http://cassandra.apache.org/" target="_blank">Cassandra</a>.</p>
      <p>If you're dealing more with relationships than data, you might want a graph-based db like <a href="https://neo4j.com/developer/graph-db-vs-rdbms/" target="_blank">Neo4J</a>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Of the developers in the the developer survey, 54% said they used MySQL, while 25% used the most popular NoSQL database - MongoDB.</p>
      <p>You're most likely to encounter MongoDB when working with React. A popular development stack is </p>
      <ul>
        <li>React (the application framework)</li>
        <li>Express (the backend framework)</li>
        <li>Node (the runtime environment)</li>
        <li>Mongo (the database)</li>
      </ul>
      <p>To see what different dev teams use as their stack, check out <a target="_blank" href="https://stackshare.io/feed">Stackshare</a>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Before we dive into the different individual Database Management Systems, I also wanted to mention that there's a new query language that's becoming popular:</p>
      <p><a href="https://graphql.org/" target="_blank"><strong>GraphQL</strong></a> is presented as an alternative to REST APIs. REST shares data (usually as JSON) by allowing you to make an HTTP GET request, and returning data.</p>
      <p>GraphQL does that too, <em>but unlike REST</em>, it allows you to define the format and structure of the data that gets returned, which is pretty cool.</p>
      <p>Here's <a target="_blank" href="https://blog.apollographql.com/graphql-vs-rest-5d425123e34b">a good article summarizing the topic</a>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2"><em>NoSQL Databases</em></h2>
      <h3 class="h3">MongoDB</h3>
      <p>Let's look at how data is stored in Mongo...</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
<pre class="slide-only"><code class="language-json">{
    "_id" : 1,
    "name" : {
        "first" : "John",
        "last" : "Backus"
    },
    "birth" : ISODate("1924-12-03T05:00:00Z"),
    "death" : ISODate("2007-03-17T04:00:00Z"),
    "contribs" : [
        "Fortran",
        "ALGOL",
        "Backus-Naur Form",
        "FP"
    ]
}
{
    "_id" : ObjectId("51df07b094c6acd67e492f41"),
    "name" : {
        "first" : "John",
        "last" : "McCarthy"
    },
    "birth" : ISODate("1927-09-04T04:00:00Z"),
    "death" : ISODate("2011-12-24T05:00:00Z"),
    "contribs" : [
        "Lisp",
        "Artificial Intelligence",
        "ALGOL"
    ]
}</code></pre>
      <pre class="post-only"><code class="language-json">{
    "_id" : 1,
    "name" : {
        "first" : "John",
        "last" : "Backus"
    },
    "birth" : ISODate("1924-12-03T05:00:00Z"),
    "death" : ISODate("2007-03-17T04:00:00Z"),
    "contribs" : [
        "Fortran",
        "ALGOL",
        "Backus-Naur Form",
        "FP"
    ],
    "awards" : [
        {
            "award" : "W.W. McDowell Award",
            "year" : 1967,
            "by" : "IEEE Computer Society"
        },
        {
            "award" : "National Medal of Science",
            "year" : 1975,
            "by" : "National Science Foundation"
        },
        {
            "award" : "Turing Award",
            "year" : 1977,
            "by" : "ACM"
        },
        {
            "award" : "Draper Prize",
            "year" : 1993,
            "by" : "National Academy of Engineering"
        }
    ]
}</code></pre>
      <p>Look familiar? It's JSON (well, technically it's BSON - binary JSON)!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>While concepts like table joins don't transfer to NoSQL, basic database CRUD operations remain. So instead of writing <code class="language-sql">DROP TABLE people</code>, we write <code class="language-javascript">db.people.drop()</code></p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>If you'd like to know more about how MongoDB compares to MyQL, Mongo has a (biased, but comprehensive) <a target="_blank" href="https://www.mongodb.com/compare/mongodb-mysql">write&#x2011;up on their site</a>.</p>
    </div>
  </div>
</section>
<section id="redis">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3 class="h3">Redis</h3>
      <p>Redis is a pretty fascinating "in-memory data structure store", meant to be used for really impressive caching. It definitely challenges the notions of what a database is - in some ways it's the <em>opposite</em> of ACID.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><h2 class="h2"><em>SQL Databases</em></h2><h3 class="h3">ACID compliance</h3></div>
  </div>
</section>
<section id="acid">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>One thing to note when comparing database management systems is ACID compliance.</p>
      <p>What is that, and why should we care?</p>
      <p>ACID is an acronym for what database nerds, as far back as <a href="https://dl.acm.org/citation.cfm?doid=289.291" target="_blank">1983</a>, have agreed are important standards for a database management system.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p><strong>A</strong> stands for Atomicity, which means that if one statement in a transaction fails, the whole transaction fails. If you try to insert a hundred rows, and one of your inserts is missing a closing bracket, the whole script fails.</p>
      <p><strong>C</strong> stands for Consistency, meaning that any data that breaks a rule (think data types and other constraints) is not allowed.</p>
      <p><strong>I</strong> stands for Isolation. That means that even if transactions run at the same time, you get the same result as if you'd run them in order.</p>
      <p><strong>D</strong> stands for Durability, meaning that after you've committed to the db, the power can out and no data will be lost. That means writing to 'non-volatile' memory (i.e. something besides RAM).</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>MySQL falls short particularly with <strong>D</strong>. But does that matter for most web projects? Simply put: no.</p>
    </div>
  </div>
</section>
<section id="postgres">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3 class="h3">Postgres</h3>
      <p>ACID compliance bragging rights <em>do</em> go to Postgres, however. Postgres is the somewhat more mature, dependable sibling to MySQL, and its robust feature set and dependability have made it the fastest growing DBMS the past three years in a row.</p>
      <p>It's got great support for JSON, impressive features like table partitioning, and cool data types like Money, Geometry, IP addresses, and data ranges.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3 class="h3">SQLite</h3>
      <p>SQLite, as the name suggests, is a "light" alternative when you want a relational database, but don't want a heavy configuration process, and you don't mind having weak security, and not having users.</p>
      <p>It's not a great tool for running a whole website, but it can be really handy for prototyping, testing, and single-user applications.</p>
    </div>
  </div>
</section>
<section id="discussion">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Discussion</h2>
      <p>What technology you decide to use can be a factor in whether a project succeeds or fails. Even as a junior developer, you should be able to take part in those discussions, and push back when someone (*ahem* management) starts taking you down the wrong path. It's not about having all the answers, but asking good questions.</p>
      <p>Get in small groups. Talk about what questions might be important when deciding on a database solution.</p>
    </div>
  </div>
</section>
<section id="review">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Review</h2>
      <p>I'm gonna give you guys prep exercises next week, but for now, I wanted to review the two most requested topics (by far).</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><h2 class="h2">Reviewing Routines</h2>
      <p>Routines are things you can create and save in the database to make life easier.</p>
      <p>There are two kinds of routine: procedures and functions.</p>
      <p>Procedures <em>do a job for you</em>.</p>
      <p>Functions <em>get a value for you</em>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>This procedure does <em>nothing</em>.</p>
      <pre class="slide-only"><code class="language-sql">DELIMITER $$
CREATE PROCEDURE i_do_nothing()
BEGIN
  -- nothing happens
END$$</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="190" cols="50" class="post-only">DELIMITER $$
CREATE PROCEDURE i_do_nothing()
BEGIN
  -- nothing happens
END$$</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">We then do nothing by calling it.
      <pre class="slide-only"><code class="language-sql">CALL i_do_nothing()</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">CALL i_do_nothing()</textarea></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><p>This <em>can</em> do something (when we call it).</p>
      <pre class="slide-only"><code class="language-sql">DELIMITER $$
CREATE PROCEDURE i_do_something()
BEGIN
  INSERT INTO authors (author_id, first_name, last_name) 
    VALUES (NULL, 'Christopher', 'Pike');
END$$</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="190" cols="50" class="post-only">DELIMITER $$
CREATE PROCEDURE i_do_something()
BEGIN
  INSERT INTO authors (author_id, first_name, last_name) 
    VALUES (NULL, 'Christopher', 'Pike');
END$$</textarea></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><p>But it's not a very <em>useful</em> something. It does nothing we couldn't do just by writing <code>INSERT INTO authors (author_id, first_name, last_name) 
    VALUES (NULL, 'Christopher', 'Pike');</code>. It's not yet making life any easier.</p></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><p>That's where variables come in.</p></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><pre class="slide-only"><code class="language-sql">DELIMITER $$
CREATE PROCEDURE i_do_something_useful(
  IN p_first_name VARCHAR(50),
  IN p_last_name  VARCHAR(50)
)
BEGIN
  INSERT INTO authors (
    author_id, 
    first_name, 
    last_name
  ) 
    VALUES (NULL, p_first_name, p_last_name);
END$$</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="280" cols="50" class="post-only">DELIMITER $$
CREATE PROCEDURE i_do_something_useful(
  IN p_first_name VARCHAR(50),
  IN p_last_name  VARCHAR(50)
)
BEGIN
  INSERT INTO authors (author_id, first_name, last_name) 
    VALUES (NULL, p_first_name, p_last_name);
END$$</textarea></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">Now we've made something useful - because <pre class="slide-only"><code class="language-sql">CALL i_do_something_useful('J.K.', 'Rowling');</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">CALL i_do_something_useful('J.K.', 'Rowling');</textarea> is simpler and safer than writing out a whole insert statement.</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">In <code>i_do_something_useful()</code> we had a variable that got its value from an input parameter - the value you supply in the parentheses when you <code>CALL</code> it.</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Variables can also be internal - meaning their value doesn't come from the <code>CALL</code> statement.</p>
      <pre class="slide-only"><code class="language-sql">DELIMITER $$
CREATE PROCEDURE too_many_tolkiens()
BEGIN
  DECLARE p_tolkien INT;
  SELECT author_id INTO p_tolkien
    FROM authors
    WHERE UPPER(last_name) = 'TOLKIEN'
    ORDER BY author_id
    LIMIT 1;
  DELETE FROM authors WHERE author_id = p_tolkien;
END$$</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="340" cols="50" class="post-only">DELIMITER $$
CREATE PROCEDURE too_many_tolkiens()
BEGIN
  DECLARE p_tolkien INT;
  SELECT author_id INTO p_tolkien
    FROM authors
    WHERE UPPER(last_name) = 'TOLKIEN'
    ORDER BY author_id
    LIMIT 1;
  DELETE FROM authors WHERE author_id = p_tolkien;
END$$</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><h2 class="h2">Functions</h2>
      <pre class="slide-only"><code class="language-sql">-- Define the useless function
DELIMITER $$
CREATE FUNCTION i_return_nothing()
RETURNS INT
BEGIN
  RETURN 0;
END$$
-- Use the useless function
SELECT i_return_nothing();</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="280" cols="50" class="post-only">-- Define the useless function
DELIMITER $$
CREATE FUNCTION i_return_nothing()
RETURNS INT
BEGIN
  RETURN 0;
END$$
-- Use the useless function
SELECT i_return_nothing();</textarea>
      </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><pre class="slide-only"><code class="language-sql">-- Define the stupid function
DELIMITER $$
CREATE FUNCTION what_is_two_plus_two()
RETURNS INT
BEGIN
  RETURN 2 + 2;
END$$
-- Call the stupid function
SELECT what_is_two_plus_two()</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="280" cols="50" class="post-only">-- Define the stupid function
DELIMITER $$
CREATE FUNCTION what_is_two_plus_two()
RETURNS INT
BEGIN
  RETURN 2 + 2;
END$$
-- Call the stupid function
SELECT what_is_two_plus_two()</textarea></div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><pre class="slide-only"><code class="language-sql">-- Define the smart function
DELIMITER $$
CREATE FUNCTION what_is_anything_plus_two(
  some_user_input INT
)
RETURNS INT
BEGIN
  RETURN some_user_input + 2;
END$$
-- Use the smart function
SELECT what_is_anything_plus_two(17)</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="290" cols="50" class="post-only">-- Define the smart function
DELIMITER $$
CREATE FUNCTION what_is_anything_plus_two(some_user_input INT)
RETURNS INT
BEGIN
  RETURN some_user_input + 2;
END$$
-- Use the smart function
SELECT what_is_anything_plus_two(17)</textarea></div>
  </div>
</section>
<section id="joins">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">JOINS!<br><span role="img" aria-label="backhand index pointing right">👉</span><span role="img" aria-label="backhand index pointing left">👈</span></h2>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>A join is when you merge data from two (or more) different tables to create your results table.</p>
      <p>We match rows from each of the tables by selecting one column from each to match up.</p>
      <pre class="slide-only"><code class="language-sql">SELECT [columns] 
FROM [table] 
  [INNER|OUTER (RIGHT|LEFT)] JOIN
  [otherTable]
  ON [table].[column] = [otherTable].[column]</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="160" cols="50" class="post-only">SELECT [columns] 
FROM [table] 
  [INNER|OUTER (RIGHT|LEFT)] JOIN
  [otherTable]
  ON [table].[column] = [otherTable].[column]</textarea>
</div>
</div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Usually, joins are what we call an 'inner join'. Inner join is the default. You don't even have to write <code class="language-sql">INNER JOIN</code>, you can just write <code class="language-sql">JOIN</code>.</p>
      <p>The type of join determines what data to include from the tables being joined.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Inner joins <strong>only</strong> include data from rows <strong>where a match is found in both tables.</strong></p>
      <p>Left outer joins include data from rows where a match is found in both tables <strong>plus rows from the first table</strong>.
      <p>Right outer joins include data from rows where a match is found in both tables <strong>plus rows from the second table</strong>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <figure>
        <img class="diagram" src="/images/join-example.png" alt="Simple demonstration of the results of different joins.">  
      </figure>
    </div>
  </div>
</section>
<section id="onClause">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>We define a relationship between two tables by using the clause <code class="language-sql">ON</code> to reference a column from each table to be our matching key.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Let's see a table of invoices with the vendor name and the date they paid.</p>
      <pre class="slide-only"><code class="language-sql">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on" 
FROM invoices
JOIN vendors ON invoices.vendor_id = vendors.vendor_id</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="190" cols="50" class="post-only">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on" 
FROM invoices
JOIN vendors 
  ON invoices.vendor_id = vendors.vendor_id</textarea>
</div>
</div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>The invoice due date and the paid date come from the <code>invoices</code> table, but the vendor name comes from the vendors table. We can retrieve information about a vendor by looking up the vendor's id. This way the <code>invoices</code> table doesn't have to repeat information about every vendor - we just have to store it once in the <code>vendors</code> table.</p>
      <p>This is an inner join, which means the results table will <em>only</em> show a row for invoices that have a vendor <strong>and</strong> vendors that have an invoice.</p>
    </div>
  </div>
</section>
<section id="tableAliases">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Let's run that code again, with a slight modification to produce an error! <span role="img" aria-label="fire">🔥</span><span role="img" aria-label="Person gesturing no">🙅</span><span role="img" aria-label="fire">🔥</span></p> 
      <pre class="slide-only"><code class="language-sql">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on",
  vendor_id 
FROM invoices
JOIN vendors ON invoices.vendor_id = vendors.vendor_id</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="220" cols="50" class="post-only">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on",
  vendor_id 
FROM invoices
JOIN vendors 
  ON invoices.vendor_id = vendors.vendor_id</textarea>
      <p>...gives us the error <code>column ambiguously defined</code>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>When two tables have the same column name, we have to specify what table the column is coming from. We do this by prefixing the column name with the table name and a dot.</p>
      <p>To make this easier, we can alias our tables, similar to how we alias our columns, but without the need for the <code>AS</code> operator. We can simply add the alias with a space after the table name in the join syntax.</p>
      <pre class="slide-only"><code class="language-sql">SELECT invoice_due_date, v.vendor_id, payment_date
FROM invoices i
JOIN vendors v 
ON i.vendor_id = v.vendor_id</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT invoice_due_date, v.vendor_id, payment_date
FROM invoices i
JOIN vendors v 
ON i.vendor_id = v.vendor_id</textarea>
    </div>
  </div>
</section>
<section id="outerJoins">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>We've seen a list of all the invoices and their associated vendors. What if we wanted to include vendors that <em>didn't</em> have an invoice? That's where we'd use an outer join - in this case, a <code class="language-sql">RIGHT JOIN</code> because we want to include data that only appears on the <strong>right</strong> side of the <code>JOIN</code> clause.</p>
      <pre class="slide-only"><code class="language-sql">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on" 
-- left side
FROM invoices 
-- right side
RIGHT JOIN vendors
ON invoices.vendor_id = vendors.vendor_id
ORDER BY "Due on" DESC</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="280" cols="50" class="post-only">SELECT invoice_due_date AS "Due on", 
  vendor_name AS "Due from", 
  payment_date AS "Paid on" 
-- left side
FROM invoices 
-- right side
RIGHT JOIN vendors
ON invoices.vendor_id = vendors.vendor_id
ORDER BY "Due on" DESC</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Let's look at a few more examples!</p>
      <p>A 'left' outer join, as you'd expect, works the same way as a right join, only it includes records that are only from the left side of the join.</p>
      <pre class="slide-only"><code class="language-sql">SELECT department_name, d.department_number, last_name
FROM departments d
LEFT JOIN employees e
ON d.department_number = e.department_number</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT department_name, d.department_number, last_name
FROM departments d
LEFT JOIN employees e
ON d.department_number = e.department_number</textarea>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">  
      <p>A join creates a row by <strong>merging</strong> rows from different tables.</p>
      <p>An inner join will <strong>only</strong> created a row <em>if</em> there are two rows to merge - only if a match can be found based on the <code>ON</code> clause.</p>
      <p>A left join will create a row for <em>every</em> row in the first table, even if there is no match for a row from <strong>the second</strong> table. A right join will do the opposite - create a row in the results table for every row in the <em>second</em> table, even if there is no match from <strong>the first table.</strong></p>
      <p>A full join creates a row for every row in <em>both</em> tables - whether or not they can be merged.</p> 
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p><img class="diagram" src="/images/basic-joins.png" alt="Four diagrams illustrating four types of JOIN"></p>  
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Let's review our types of joins</h2>
      <p>Say we have two tables: one for assignments, one for students.</p>
    </div>
  </div>
  <div class="grid-x">
    <div class="cell medium-10 medium-offset-1 slide-half-col">
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
    <div class="cell medium-10 medium-offset-1 slide-half-col">
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
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3>Inner join</h3>
      <pre class="slide-only"><code class="language-sql">SELECT student, assignment
FROM assignments
JOIN students
ON assignments.class = students.class</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="130" cols="50" class="post-only">SELECT student, assignment
FROM assignments
JOIN students
ON assignments.class = students.class</textarea>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Lab</td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td>Exam</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3>Left (outer) join</h3>
      <pre><code class="language-sql">SELECT student, assignment
FROM assignments
LEFT JOIN students
ON assignments.class = students.class</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Lab</td>
          </tr>
          <tr>
            <td><code>(null)</code></td>
            <td>Lab</td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td>Exam</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3>Right (outer) join</h3>
      <pre><code class="language-sql">SELECT student, assignment
FROM assignments
RIGHT JOIN students
ON assignments.class = students.class</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Lab</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td><code>(null)</code></td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td>Exam</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3>Mimicing a Full (outer) join</h3>
      <p>Unlike most other SQL-driven RDBMS', MySQL does not feature a <code>FULL JOIN</code>. However, we can mimic it with the <code>UNION</code> clause, which combines queries (while omitting duplicate rows).</p>
      <p>If we create a <code>UNION</code> between a right join and a left join, we get an identical result to a full join.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <pre><code class="language-sql">SELECT student, assignment FROM assignments
LEFT JOIN students
  ON assignments.class = students.class
UNION
SELECT student, assignment FROM assignments
RIGHT JOIN students
  ON assignments.class = students.class</code></pre>
      <table>
        <tbody>
          <tr>
            <td>Birinder</td>
            <td>Lab</td>
          </tr>
          <tr>
            <td><code>(null)</code></td>
            <td>Paper</td>
          </tr>
          <tr>
            <td>Amandeep</td>
            <td><code>(null)</code></td>
          </tr>
          <tr>
            <td>Ryan</td>
            <td>Exam</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <div class="callout alert">
        <p>Why would we <code>RIGHT JOIN</code> table A with table B when we could <code>LEFT JOIN</code> table B with table A?</p>  
        <p>The answer is, normally, we wouldn't. Right joins only really come in handy when we're joining more than one table and things start to get awkward syntactically.</p>
      </div>
    </div>
  </div>
</section>
<section id="joiningMultiple">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Joining multiple tables</h2>
            <p>Tables can effectively be 'chained' together using joins.</p>
      <p class="callout alert">This can come in particularly handy when using an intermediary table to break up a many-to-many relationship into two one-to-many relationships.</p>
</div>
</div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
<pre><code class="language-sql">SELECT 
    vendor_name, 
    invoice_number, 
    invoice_date, 
    line_item_amount, 
    account_description
FROM vendors v
    JOIN invoices i
        ON v.vendor_id = i.vendor_id
    JOIN invoice_line_items li
        ON i.invoice_id = li.invoice_id
    JOIN general_ledger_accounts gl
        ON li.account_number = gl.account_number
WHERE (invoice_total - payment_total - credit_total) > 0
ORDER BY vendor_name, line_item_amount DESC</code></pre>
    </div>
  </div>
</section>