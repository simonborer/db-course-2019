---
title: "Week 9 - State of DB; Final Review"
date: 2019-10-29T08:47:11+01:00
publishdate: 2020-11-02T08:47:11+01:00
featured_image: 2019.png
summary: "This week we'll cover the state of databases in 2019."
today:
  -
    title: Databases in 2019
    id: 2019
  - 
    title: Acid Compliance
    id: acid
  -
    title: PostreSQL
    id: postgres
  -
    title: MongoDB
    id: mongo
  -
    title: Redis
    id: redis
  -
    title: Discussion
    id: discussion
  -
    title: Assignment
    id: lab
---
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
      <p>In 2019, MySQL is the DBMS used by most developers<sup><a href="https://insights.stackoverflow.com/survey/2019#technology-_-databases">2</a></sup>.</p>
      <img src="/images/use.png" alt="Stackoverflow developer survey">
      <p>In 2019, the #1 most frequently discussed database management system is Oracle<sup><a href="https://db-engines.com/en/ranking">1</a></sup>.</p>
      <img src="/images/discussion.png" alt="Rankings from db-engines.com">
      <p>Postgres gained the most market share since last year<sup><a href="https://insights.stackoverflow.com/survey/2018#technology-_-databases">3</a></sup>, and is now the #2 most-used DBMS overall.</p>
      <em><strong>Note:</strong> I strongly encourage you to check out the entire <a href="https://insights.stackoverflow.com/survey/2019">Stack Overflow Developer survey</a>. It will give you a lot of insight into the community you're joining, including things like demographics, job turnover, gender equality, salary, etc.</em>
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
      <p>If your primary concern is high-speed caching of data, a key-value store db like Redis might be the best choice.</p>
      <p>If you're dealing with huge chunks of inconsistently structured data, you might need a column-store db like Cassandra.</p>
      <p>If you're dealing more with relationships than data, you might want a graph-based db like Neo4J.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>You're most likely to encounter MongoDB when working with React. A popular development stack is </p>
      <ul>
        <li>React (the application framework)</li>
        <li>Express (the backend framework)</li>
        <li>Node (the runtime environment)</li>
        <li>Mongo (the database)</li>
      </ul>
      <p>To see what different dev teams use as their stack, check out <a href="https://stackshare.io/feed">Stackshare</a></p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Before we dive into the different individual Database Management Systems, I also wanted to mention that there's a new query language that's becoming popular:</p>
      <p><strong>GraphQL</strong> is presented as an alternative to REST APIs. REST shares data (usually as JSON) by allowing you to make an HTTP GET request, and returning data.</p>
      <p>GraphQL does that too, <strong>BUT</strong>, unlike REST, it allows you to define the format and structure of the data that gets returned, which is pretty cool.</p>
      <p>Here's <a href="https://blog.apollographql.com/graphql-vs-rest-5d425123e34b">a good article summarizing the topic</a>.</p>
    </div>
  </div>
</section>
<section id="postgres">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Postgres</h2>
      <p>ACID compliance bragging rights <em>do</em> go to Postgres, however. Postgres is the somewhat more mature, dependable sibling to MySQL, and its robust feature set and dependability have made it the fastest growing DBMS the past three years in a row.</p>
      <p>It's got great support for JSON, impressive features like table partitioning, and cool data types like Money, Geometry, IP addresses, and data ranges.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">NoSQL</h2>
    </div>
  </div>
</section>
<section id="mongo">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">MongoDB</h2>
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
    ],
    "awards" : [
        {
            "award" : "Turing Award",
            "year" : 1971,
            "by" : "ACM"
        },
        {
            "award" : "Kyoto Prize",
            "year" : 1988,
            "by" : "Inamori Foundation"
        },
        {
            "award" : "National Medal of Science",
            "year" : 1990,
            "by" : "National Science Foundation"
        }
    ]
}

{
    "_id" : 3,
    "name" : {
        "first" : "Grace",
        "last" : "Hopper"
    },
    "title" : "Rear Admiral",
    "birth" : ISODate("1906-12-09T05:00:00Z"),
    "death" : ISODate("1992-01-01T05:00:00Z"),
    "contribs" : [
        "UNIVAC",
        "compiler",
        "FLOW-MATIC",
        "COBOL"
    ],
    "awards" : [
        {
            "award" : "Computer Sciences Man of the Year",
            "year" : 1969,
            "by" : "Data Processing Management Association"
        },
        {
            "award" : "Distinguished Fellow",
            "year" : 1973,
            "by" : " British Computer Society"
        },
        {
            "award" : "W. W. McDowell Award",
            "year" : 1976,
            "by" : "IEEE Computer Society"
        },
        {
            "award" : "National Medal of Technology",
            "year" : 1991,
            "by" : "United States"
        }
    ]
}

{
    "_id" : 4,
    "name" : {
        "first" : "Kristen",
        "last" : "Nygaard"
    },
    "birth" : ISODate("1926-08-27T04:00:00Z"),
    "death" : ISODate("2002-08-10T04:00:00Z"),
    "contribs" : [
        "OOP",
        "Simula"
    ],
    "awards" : [
        {
            "award" : "Rosing Prize",
            "year" : 1999,
            "by" : "Norwegian Data Association"
        },
        {
            "award" : "Turing Award",
            "year" : 2001,
            "by" : "ACM"
        },
        {
            "award" : "IEEE John von Neumann Medal",
            "year" : 2001,
            "by" : "IEEE"
        }
    ]
}

{
    "_id" : 5,
    "name" : {
        "first" : "Ole-Johan",
        "last" : "Dahl"
    },
    "birth" : ISODate("1931-10-12T04:00:00Z"),
    "death" : ISODate("2002-06-29T04:00:00Z"),
    "contribs" : [
        "OOP",
        "Simula"
    ],
    "awards" : [
        {
            "award" : "Rosing Prize",
            "year" : 1999,
            "by" : "Norwegian Data Association"
        },
        {
            "award" : "Turing Award",
            "year" : 2001,
            "by" : "ACM"
        },
        {
            "award" : "IEEE John von Neumann Medal",
            "year" : 2001,
            "by" : "IEEE"
        }
    ]
}</code></pre>
      <p>Look familiar? It's not SQL, it's JSON (well, technically it's BSON - binary JSON).</p>
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
      <p>If you'd like to know more about how MongoDB compares to MyQL, Mongo has a (biased, but comprehensive) <a href="https://www.mongodb.com/compare/mongodb-mysql">write-up on their site</a>.</p>
    </div>
  </div>
</section>
<section id="redis">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Redis</h2>
      <p>Redis is a pretty fascinating "in-memory data structure store", meant to be used for really impressive caching. It definitely challenges the notions of what a database is - in some ways it's the <em>opposite</em> of ACID.</p>
    </div>
  </div>
</section>
<section id="acid">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">ACID compliance</h2>
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

<section id="discussion">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Discussion</h2>
      <p>What technology you decide to use can be a factor in whether a project succeeds or fails. Even as a junior developer, you should be able to take part in those discussions, and push back when someone (*ahem* management) starts taking you down the wrong path. It's not about having all the answers, but asking good questions.</p>
      <p>Get in small groups. Talk about what questions might be important when deciding on a database solution.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><h2 class="h2">Reviewing Routines</h2>
      <p>There are two kinds of routine: procedures and functions.</p>
      <p>Procedures <em>do a job for you</em>.</p>
      <p>Functions <em>get a value for you</em>.</p>
      <p>Routines are things you can create and save in the database to make things easier.</p>
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
      <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">DELIMITER $$

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
    <div class="cell large-10 large-offset-1"><p>This <em>can</em> something (when we call it).</p>
      <pre class="slide-only"><code class="language-sql">DELIMITER $$

CREATE PROCEDURE i_do_something()
BEGIN
  INSERT INTO authors (author_id, first_name, last_name) 
    VALUES (NULL, 'Christopher', 'Pike');
END$$</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">DELIMITER $$

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
  INSERT INTO authors (author_id, first_name, last_name) 
    VALUES (NULL, p_first_name, p_last_name);
END$$</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">DELIMITER $$

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
    <div class="cell large-10 large-offset-1">Now we've made something useful - because <code>CALL i_do_something_useful('J.K.', 'Rowling');</code> is simpler and safer than writing out a whole insert statement.</div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">In <code>i_do_something_useful()</code> we had a variable that got its value from an input parameter - the value you supply in the paranthese when you <code>CALL</code> it.</div>
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
      <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">DELIMITER $$

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
      <pre class="slide-only"><code class="language-sql">DELIMITER $$

CREATE FUNCTION i_return_nothing()
RETURNS INT
BEGIN
  RETURN 0;
END$$

SELECT i_return_nothing();</code></pre>
      <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">DELIMITER $$

CREATE FUNCTION i_return_nothing()
RETURNS INT
BEGIN
  RETURN 0;
END$$

SELECT i_return_nothing();</textarea>
      </div>
  </div>
</section>
<!-- <section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Another discussion</h2>
    </div>
  </div>
</section> -->

<!-- <section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>You run a bakery.</p>
      <p>Your bakery has three locations in the west end of Toronto.</p>
      <p>Your bakery has 2 types of employee - bakers and cashiers.</p>
      <p>Your bakery initially produces 6 types of pasteries, and 4 types of bread. You also serve coffee. You might add more items later on.</p>
      <p>Working with your data, you might need to...</p>

    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <ul>
        <li>create a schedule for your employees, keeping in mind that 
          <ul>
            <li>no employee can work more than 44 hours/week</li>
            <li>no employee can work less than 25 hours/week</li>
            <li>shifts are a minimum of 4 hours, and a maximum of 8</li>
            <li>employees can be scheduled to work at different locations</li>
            <li>cashiers cannot bake, and bakers cannot do cashier duties</li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <ul>
        <li>create a menu, factoring in that 
          <ul>
            <li>each week the price of a different item is reduced by 20%</li>
            <li>each week the price of two items are reduced by 10%</li>
          </ul>
        </li>
        <li>evaluate the cost of items including materials and labour, and try to find efficiencies; each type of food or beverage should list the total cost of ingredients; the food should list the baking time, and the bakers' prep time, along with the required baking temperature and the required oven space</li>
        <li>track transactions at the bakery</li>
      </ul>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>How do you design your database tables?</p>
      <p>Will you be able to...</p>
      <ul>
        <li>write a stored procedure to add a new type of bread?</li>
        <li>write a function to return the menu?</li>
        <li>validate the data so that you can create a new schedule?</li>
        <li>create a baking schedule (keeping in mind that there is limited oven space, varied by location, and that foods with the same baking temperature can share an oven)?</li>
        <li>calculate the cost per unit of different foods (factoring in the labour involved)?</li>
      </ul>
      <p>Also, try thinking about what other metrics could you track/calculate to help the business?</p>
    </div>
  </div>
</section> -->