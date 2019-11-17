---
title: "Week 8 - Triggers, Views & Users"
date: 2019-10-22T08:47:11+01:00
publishdate: 2019-11-02T08:47:11+01:00
featured_image: notpass.jpg
summary: "This week we'll cover triggers, views & user management. You'll also receive your final assignment."
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
            <li class="slide-only"><a href="#last-quiz">Last week's quiz</a></li>
            <li><a href="#assignment">Final Assignment</a></li>
            <li><a href="#users">Users</a></li>
            <li><a href="#views">Views</a></li>
            <li><a href="#triggers">Triggers</a></li>
        </ol>
      </div>
    </div>
</section>
<!-- Yo, make sure to find out what they want to review next week. -->
<section class="slide-only">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1" id="Quiz"><h2 class="h2">Quiz!</h2></div>
  </div>
</section>
<section id="last-quiz">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><h2 class="h2">Last week's quiz</h2>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p><code>SELECT YEAR(NOW())</code> is the same as <code>SELECT EXTRACT(YEAR_MONTH FROM NOW())</code> <hr><strong>false</strong></p>
      <p>
      <em><code>SELECT EXTRACT(YEAR_MONTH FROM NOW())</code> gets the year AND the month</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p><code>SELECT CURDATE()</code> is the same as <code>SELECT DATE(NOW())</code> <hr><strong>true</strong></p><p><em>Yup, same thing.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p><code>SELECT DATE_FORMAT(NOW(),'%m')</code> is the same as <code>SELECT EXTRACT(MONTH FROM NOW())</code> <hr><strong>true</strong></p><p><em>Again, exactly the same.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p><code>CAST()</code>, <code>CONVERT()</code>, and <code>STR_TO_DATE()</code> can all turn a string into a date <hr><strong>true</strong></p><p><em>They can! <code>STR_TO_DATE()</code> can only do that, whereas the others can convert different data types into other data types.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p>The <code>DATEDIFF()</code> function returns the difference between two dates in years, weeks, or days<hr><strong>true</strong></p><p><em>Yessir.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p>Self joins are common <hr><strong>false</strong></p><p><em>Nope, a self join - used to create a list of things that have common values within a single table, is a very niche operation.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p>Normalization is the process of merging tables together <hr><strong>false</strong></p><p><em>Nope, that would be <code>JOIN</code>s. Normalization reduces the need for duplicated data.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p>You can pass a <code>NULL</code> value to an auto-incremented column even if it is set to <code>NOT NULL</code><hr><strong>true</strong></p><p><em>Yes! Because it doesn't <strong>end up</strong> being null, it ends up auto-incremented.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p>The <code>ON DELETE CASCADE</code> command deletes foreign key constraints <hr><strong>false</strong></p><p><em><code>ON DELETE CASCADE</code> <strong>uses</strong> foreign key constraints to know which data to delete from referenced tables. The constraints themselves don't go anywhere.</em></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1 review">
      <p>Using <code>NOW()</code> as the default for a column is an easy way to timestamp your <hr><strong>true</strong></p><p><em>Yup, it's handy.</em></p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <hr class="post-only">
      <h3 class="h3">The next 3 weeks will be as follows:</h3>
      <p><strong>Next week</strong> we'll be looking at what other kinds of databases are out there, and what the database world looks like in 2019. Mostly though, I'll be giving you a review on the term's materials to prep for the final exam.</p>
      <p>The remainder of the time, you'll be able to check in with me about the progress of your final assignment.</p>
      <p>The <strong>following week</strong>, you'll be presenting your final assignments to the class (which we'll talk about momentarily).</p>
      <p>In <strong>three weeks</strong>, on December 9th, you'll take your final exam. The format will be similar to the midterm.</p>
    </div>
  </div>
</section>
<section id="assignment">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Your assignment</h2>
      <p>Try to create a feature for a library's database.</p>
      <p>In development teams, you have to share your code with the team, often when it is unfinished. </p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><p><h3 class="h3">What to talk about</h2></p>
      <ol>
        <li>What you are trying to do?</li>
        <li>Why you are trying to do it?</li>
        <li>How you are trying to do it?</li>
        <li>Why did you <em>not</em> do it another way?</li>
        <li>What is working well?</li>
        <li>What is not going well?</li>
        <li>What you are going to do next?</li>
        <li>When will you know you are done, and how are you going to get there?</li>
      </ol>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Your assignment is to <em>try</em> to create a feature.</p>
      <p>You'll get up to <strong>5 minutes</strong> to talk us through your code, and show us your work.</p>
      <p>Include comments in your code explaining what each block of code does.</p>
      <p>If your code doesn't work, <strong>that's ok.</strong></p>
          </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h3 class="h3">You're being marked on the following:</h3>
      <ul>
        <li>How well do you explain the state and progress of your work (see above, 1-8)? <strong>5 marks</strong></li>
        <li>How well did you plan and scope your feature? <strong>2 marks</strong></li>
        <li>How innovative was your feature? <strong>1 mark</strong></li>
        <li>How useful would your feature be to end-users and/or other developers? <strong>1 mark</strong></li>
        <li>How well-formatted/easy-to-read is your code? <strong>1 mark</strong></li>
      </ul>
      <p><em>Note: make sure that you're able to present using the projector.</em></p>
    </div>
  </div>
</section>
<section id="triggers">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Triggers</h2>
      <pre><code class="language-sql">
DELIMITER //
CREATE TRIGGER max_renewals
  BEFORE UPDATE ON withdrawals
    FOR EACH ROW
  BEGIN
    IF (OLD.renewals > 1) THEN
      -- Note: 45000 is a code for 
      -- a generic, user-defined error
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No more renewals allowed';
    END IF;
  END
//</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Triggers are like stored procedures that fire <code>BEFORE</code> or <code>AFTER</code> a data manipulation event (<code>INSERT</code>, <code>UPDATE</code>, <code>DELETE</code>)</p>
      <p>They are great for defining error logic, and maintaining data integrity.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>Let's break down that trigger.</p>
      <img src="https://d3nevzfk7ii3be.cloudfront.net/igi/UOl6JFP4SIafwQkb.medium" alt="nerf">
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <pre><code class="language-sql">-- create it and name it
CREATE TRIGGER max_renewals
-- Before or after?
-- What event on what table? In this case, an 
-- UPDATE on the withdrawals table
  BEFORE UPDATE ON withdrawals
-- This is to specify that this trigger
-- should be run on each affected row
-- for example, if we updated with a WHERE condition
  FOR EACH ROW</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
    <p>The rest of the trigger is familiar with the exception of the <code>OLD</code> keyword.</p>
    <pre class="slide-only"><code class="language-sql">IF (OLD.renewals > 1) THEN</code></pre>
    <textarea data-code-mirror="sql" data-code-mirror-height="40" cols="50" class="post-only">IF (OLD.renewals > 1) THEN</textarea>
    <p>The keywords <code>OLD</code> and <code>NEW</code> let us differentiate the <em>existing</em> value and the <em>new value</em> when performing an update.</p>
  </div>
</section>
<section id="views">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Views</h2>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>A view is a query that acts as a pseudo-table. You can even update the original tables by referencing it in an update statement<a href="#conditions">*</a>.</p>
      <pre><code class="language-sql">CREATE VIEW books_and_authors 
  AS
    SELECT title, CONCAT(first_name, ' ', last_name) 
      AS name 
    FROM books b JOIN authorship atp 
      ON b.book_id = atp.book_id 
      JOIN authors a 
        ON a.author_id = atp.author_id</code></pre>
      <p>For the most part, though, views are used to make queries simpler, and to make certain data available to relevant users.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p id="conditions">You can update a view unless it contains:</p>
      <ul>
        <li>aggregate functions such as MIN, MAX, SUM, AVG, and COUNT.</li>
        <li>DISTINCT</li>
        <li>a GROUP BY clause</li>
        <li>a HAVING clause</li>
        <li>a UNION clause</li>
        <li>a left join or outer join</li>
        <li>a subquery in the SELECT clause or in the WHERE clause that refers to the table appeared in the FROM clause</li>
      </ul>
    </div>
  </div>
</section>
<section id="permissions">
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <h2 class="h2">Create a user</h2>
      <p>Let's add a user to our database.</p>
      <pre><code class="language-sql">-- Username
CREATE USER tyler 
-- password
IDENTIFIED BY 'tyler1234'</code>
      </pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1">
      <p>By default, users have <em>no</em> privileges.</p>
      <pre><code class="language-sql">SELECT * FROM mysql.user WHERE user = 'tyler';</code></pre>
      <p>Let's grant <code>tyler</code> access to our view.</p>
      <pre><code class="language-sql">GRANT SELECT ON books_and_authors
TO tyler</code></pre>
      <p>Now <code>tyler</code> books and authors!</p>
      <p><em>Note: you won't be able to grant privileges to users because - you guessed it - you don't have the right privileges!</em></p>
      <p>Here is a <a href="https://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html">list of all available privileges</a>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-10 large-offset-1"><p>Users and user privileges are generally managed by the website/application. For example, a library would give access to the database at a librarian's terminal, but only give read access at a public kiosk. These permissions would typically be managed through the website, and the website would be the 'user' as far as the database is concerned.</p>
    <p>What this means is, the website is connecting to the database using a single set of credentials (username/password).</p>
    <p>The "filtering" of information happens in the server-side code based on the user. Users would not be presented with options on the website that they don't have permissions for in the database.</p></div>
  </div>
</section>