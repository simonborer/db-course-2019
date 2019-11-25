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
<section id="hackathon">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Hackathon!</h2>
      <p>Today we will be conceptualizing and rapidly prototyping features.</p>
      <p>Isn't that exciting??</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>First, we'll look at an existing project (which I spent waaaaay too much time on).</p>
      <p>We'll get it working on your local.</p>
      <p>We'll brainstorm ideas for how to improve, or build on top of the existing framework.</p>
      <p>You'll switch to a feature branch in git, and, when you're happy (or when time runs out), you'll submit a pull request to the master branch.</p>
    </div>
  </div>
</section>
<section id="environment">
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Environment</h2>
      <ul>
        <li>Open your terminal application.</li>
        <li><code>cd</code> into the directory where you keep your projects.</li>
        <li>Run <code>git clone https://github.com/simonborer/phpmysql.git</code>.</li>
        <li>In MAMP, go to <code>preferences > web server</code>, and under 'document root', select the 'phpmysql' folder that you just cloned.</li>
        <li>Open MAMP and start your server.</li>
        <li>Go to localhost:8888 in your browser, or click the 'MY WEBSITE' link on the MAMP start page.</li>
      </ul>
    </div>
  </div>
</section>

<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Is it working? Of course not!</p>
      <p>This application is built on top of the database architecture from <em>my</em> database.</p>
      <p>You may want to start by looking at the file <code>config__connection.php</code>. Is that your database name?</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Next we need to look at <code>config__query.php</code>.</p>
      <p>Here I've stored 3 hard-coded query strings - one to get employees, one to get locations, and one called $sqlTimeTable.</p>
      <p>$sqlTimeTable is based on a view I've created.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Do you need this view to get your page to work?</p>
      <pre><code class="language-sql">CREATE OR REPLACE VIEW `schedule` 
AS select
    concat(`e`.`first_name`, ' ', `e`.`last_name`) AS `name`,
    `e`.`employee_type` AS `employee_type`,
    `l`.`address` AS `address`,
    date_format(`s`.`start_time`, '%b %e') AS `day`,
    date_format(`s`.`start_time`, '%k:%i') AS `start`,
    date_format(`s`.`end_time`, '%k:%i') AS `end`
from
    ((`bakery_shifts` `s`
join `bakery_employees` `e` on
    ((`s`.`employee_id` = `e`.`employee_id`)))
join `bakery_locations` `l` on
    ((`s`.`location_id` = `l`.`location_id`)))</code></pre>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Not at all!</h2>
      <p>How you want to alter your tables or change the PHP code in the project is <em>entirely</em> up to you.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Before we dive into the PHP, let's start thinking about our ultimate goal - creating a new feature or improvement.</p>
      <p>Let's see how the page works.</p>
      <p>While I'm doing that, take a look at the TODO.md file, or view <a href="https://github.com/simonborer/phpmysql/blob/master/TODO.md" target="_blank">the file on Github</a>.</p>
      <p>This is a list of ideas for improvements or additions that you <em>might</em> want to tackle today.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
      <p>That said, I'm going to come around later and hear what your ideas are - I'm totally open to whatever you want to try for.</p>
      <p>You are welcome to work in pairs, or even in groups, but you need to be making commits separately, so I can see what each of you contributed.</p>
      <p>But keep in mind the old saying:</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p><img src="https://i.redd.it/tg6itcen4pjz.jpg" alt="What one developer can do in one month, two developers can do in two months. - Fred Brooks"></p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Aside from those pre-formatted queries, the only file you need to worry about is index.php.</p>
      <p>Everything else is just styles and page templating.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>As we go through the process of syncing the project and our individual databases, keep in mind our debugging steps.</p>
      <p>Delete all the code and start pasting it back in block-by-block.</p>
      <p>Use <code>var_dump()</code> to look at what's in your variables.</p>
      <p>Read the documentation - or, in this case, the code comments. I put a bunch of work into them!</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>What we run into almost immediately is a 'while' loop that uses the mysqli API to print values returned by a query.</p>
      <pre><code class="language-php">if($result = mysqli_query($link, $YOUR_QUERY_STRING_VARIABLE)){
    if(mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
            echo $row['YOUR_COLUMN_NAME'];
        }
        mysqli_free_result($result);
    } else{
        echo "No records found";
    }
} else{
    echo "ERROR: Not able to execute $sql. " . mysqli_error($link);
}</code></pre>
      <p>Please feel free to copy and paste any of the code from this project to any other part of this project - this isn't a PHP class.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>I appreciate everyone's commitment to citing other people's work throughout this semester. However, this is the one class where we're not going to worry about that.</p>
      <p>I want you to do whatever you need to do to get your feature in by the end of class, even if you have to copy and paste half of stackOverflow to do it.</p>
      <p>Also, this is a pretty good <a href="https://www.tutorialrepublic.com/php-tutorial/php-mysql-crud-application.php" target="_blank">PHP/MySQL CRUD tutorial</a>.</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <p>Our hackathon has three phases:</p>
      <ol>
        <li>Scaffolding, a.k.a. getting your code to run,</li>
        <li>Ideation, a.k.a. figuring out what you think you can accomplish, and</li>
        <li>Building an actual thing.</li>
      </ol>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Scaffolding</h2>
      <p>During this phase, I will be coming around to help.</p>
      <p>This is an exercise in debugging.</p>
      <p>Start by trying to understand the underlying database architecture - everything you need to know is either in <code>config__query.php</code> or in the INSERT statement on Line 145.</p>
      <p>Compare that to the architecture you have. How can you make those compatible? By altering the query string? By altering your tables? By adding views, functions, or stored procedures to your tables?</p>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Ideation</h2>
      <p>Once you have your scaffolding, think of how you can contribute to this project.</p>
      <ul>
        <li>What can you accomplish given the time you have?</li>
        <li>Is it something other people will be working on, or do you have something unique to contribute?</li>
        <li>Will you be working with others?</li>
        <li>What would be most valuable to the site users, or to other developers?</li>
        <li>What would you have fun doing?</li>
      </ul>
    </div>
  </div>
</section>
<section>
  <div class="grid-x">
    <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">
      <h2 class="h2">Building</h2>
      <p><em>Make sure</em> you're working off of a feature branch.</p>
      <p>If something isn't working out, or you're spending too much time on it, how can you pivot?</p>
      <p>Remember, if you say you're going to do something, and end up doing something completely different, that's totally cool.</p>
      <p>Get on slack - if you're stuck on something, throw it to the group and see if anyone can help you out for a minute (just make sure you thank them in your code comments and/or commit message).</p>
    </div>
  </div>
</section>
