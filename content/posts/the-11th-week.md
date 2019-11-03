---
title: "Week 11 - Stored Procedures in Oracle"
date: 2019-11-12T08:47:11+01:00
publishdate: 2020-11-02T08:47:11+01:00
featured_image: notpass.jpg
summary: "This week we'll cover stored procedures, views, triggers, and user permissions"
today:
  -
    title: Migrating to MySQL
    id: migration
  -
    title: Views
    id: views
  -
    title: Database Users
    id: permissions
  -
    title: Triggers
    id: triggers
  -
    title: Assignment
    id: assignment
---
<section id="migration">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Step 1</h2>
      <ul>
        <li>Open MAMP and start your server.</li>
        <li>Go to <a href="http://localhost:8888/phpMyAdmin/server_sql.php">PHPMyAdmin</a>, and make sure you're on the SQL tab.</li>
        <li>Run <code class="language-sql">CREATE DATABASE bakery;</code></li>
      </ul>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Step 2</h2>
      <ul>
        <li>Open DBeaver because PHPMyAdmin is kind of awful.</li>
        <li>Create a new connection using MySQL (this may download a driver). Don't use MySQL 8 or 3, just plain ol' MySQL.</li>
        <li>Serverhost: <code>localhost</code>; Port: <code>8889</code> (not <code>8888</code>); Database: <code>bakery</code>; User name: <code>root</code>; Password: <code>root</code>;</li>
        <li>Test your connection and finish.</li>
      </ul>
    </div>
  </div>
</section>

<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Step 3</h2>
      <ul>
        <li>Create your bakery tables in MySQL. <em>Watch out for the datatypes!</em></li>  
        <li>Don't worry about the actual data just yet; that's the next step.</li>      
      </ul>
    </div>
  </div>
</section>

<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Step 4</h2>
      <ul>
        <li>Migrate your data, but take a moment to set up stored procedures to help with the import:</li>    
      </ul>
      <pre><code class="language-sql">
CREATE PROCEDURE insert_bakery_locations ( 
  IN location_id_param INT, 
  IN address_param VARCHAR(40) 
) 
BEGIN
  INSERT INTO bakery_locations (location_id, address) 
  VALUES (location_id_param, address_param); 
END</code></pre>
    </div>
  </div>
</section>
<section id="views">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Views</h2>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>A view is a query that acts as a pseudo-table. You can even update the original tables by referencing it in an update statement.</p>
      <pre><code class="language-sql">CREATE VIEW employee_locations AS
  SELECT CONCAT(first_name, ' ', last_name) AS name, address
  FROM bakery_employees JOIN bakery_locations
  ON bakery_employees.default_loc = bakery_locations.location_id</code></pre>
      <p>For the most part, though, views are used to make certain data available to relevant users.</p>
    </div>
  </div>
</section>
<section id="permissions">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Create a user</h2>
      <p>Now you have a fully populated database that you control!</p>
      <p>Let's add another user to our database.</p>
      <pre><code class="language-sql">CREATE USER tyler IDENTIFIED BY 'tyler1234'</code>
      </pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>By default, users have <em>no</em> privileges.</p>
      <pre><code class="language-sql">SELECT * FROM mysql.user WHERE user = 'tyler';</code></pre>
      <p>Let's grant <code>tyler</code> access to our view.</p>
      <pre><code class="language-sql">GRANT SELECT ON employee_locations
TO tyler</code></pre>
      <p>Now <code>tyler</code> can see who works where!</p>
    </div>
  </div>
</section>
<section id="triggers">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Triggers</h2>
      <pre><code class="language-sql no-max">CREATE TRIGGER short_on_time
  BEFORE UPDATE ON bakery_items
  FOR EACH ROW
BEGIN
  DECLARE sum_duration  INT;
  DECLARE baker_hours   INT;

  SELECT SUM(baking_time) + SUM(prep_time)
  INTO sum_duration
  FROM bakery_items;

  SELECT COUNT(*) * 8
  INTO baker_hours
  FROM bakery_employees
  WHERE LOWER(employee_type) = 'baker';

  IF sum_duration > baker_hours THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Not enough bakers to bake this.';
  END IF;
END</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Triggers are a script we write that fires <code>BEFORE</code> or <code>AFTER</code> a DML event (<code>INSERT</code>, <code>UPDATE</code>, <code>DELETE</code>)</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Let's break down that trigger.</p>
      <img src="https://d3nevzfk7ii3be.cloudfront.net/igi/UOl6JFP4SIafwQkb.medium" alt="nerf">
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <pre><code class="language-sql">-- create it and name it
CREATE TRIGGER short_on_time
-- Before or after?
-- What event? In this case, an UPDATE on the 
-- bakery_items table
  BEFORE UPDATE ON bakery_items
-- This is to specify that this trigger
-- should be run on each affected row
-- for example, if we updated with a WHERE condition
  FOR EACH ROW</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
<p>Then we run a block of code, and use it as the clause in an <code>IF</code> statement that can throw an error.</p>
<pre><code class="language-sql">IF sum_duration > baker_hours THEN
  -- HY000 is 'General error', fine to use if
  -- we're just giving the user feedback.
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Not enough bakers to bake this.';
  END IF;</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Let's see an after trigger:</p>
      <pre><code class="language-sql no-max">CREATE TRIGGER training
  AFTER INSERT ON bakery_employees
  FOR EACH ROW
BEGIN
  DECLARE new_shift INT;
  
  SELECT MAX(shift_id) + 1 
  INTO new_shift
  FROM bakery_shifts;

  INSERT INTO bakery_shifts 
  VALUES (
    new_shift, 
    NEW.employee_id, 
    NEW.default_loc,
    NOW() + INTERVAL 1 WEEK, 
    NOW() + INTERVAL 8 DAY
  );
END</code></pre>
    </div>
  </div>
</section>
<section id="assignment">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Assignment</h2>
      <ol>
        <li>In MySQL, create a view that shows the schedule for this week - the employee name, start time, end time, and the location's address.</li>
        <li>In MySQL, create a trigger that will validate that a newly entered shift is greater than 4 hours and less than 8 hours, and that the employee is working less than 44 hours in that week.</li>
      </ol>
    </div>
  </div>
</section>
