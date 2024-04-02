drop table if exists courses;
create table courses(
  id serial primary key,
  sku text not null unique,
  name text,
  description text,
  summary text,
  github text,
  discussion text,
  download text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  active boolean not null default true
);

INSERT INTO courses (id, sku, name, description, summary, github, discussion, download, created_at, updated_at, active) VALUES
(13, 'serverless-firebase', 'Going Serverless with Firebase', '<p>In this production from Big Machine, we explore what it takes to build a usable, “serverless” ecommerce application. I’m not just talking about checking out and running a Stripe charge – no we’re doing it all.</p>
', 'In this production from Big Machine, we explore what it takes to build a usable, ''serverless'' ecommerce application. I’m not just talking about checking out and running a Stripe charge – no we’re doing it all.', NULL, NULL, NULL, '2023-03-15 17:15:35.93225-07', '2023-03-15 17:15:35.93225-07', 't'),
(18, 'sql-orbit', 'SQL in Orbit', '<p>As a new DBA, You&#39;ll be given the <strong>raw data that Cassini gathered</strong> during its time orbiting Saturn and passing by Enceladus. You&#39;re going to <strong>load</strong> this data, <strong>transform</strong> it into a solid <strong>relational design</strong> using PostgreSQL, and then <strong>export</strong> it for <strong>analysis</strong> by the analytical team. When you&#39;re done, you&#39;ll be able to create tables and views, run analytical queries and tweak data as needed. You&#39;ll be on your way to your new life as a <strong>data pro</strong>.</p>
', 'You''ll learn the basics of SQL and databases using PostgreSQL and you''ll have the time of your life doing it. We use a real set of data: the analysis data from Cassini''s flybys of Enceladus. There might actually be life up there and you''re going to query the data to find out!', 'https://github.com/bigmachine-io/sql-orbit', 'https://github.com/bigmachine-io/sql-orbit/issues', 'SQL in Orbit.zip', '2023-03-15 17:15:35.937885-07', '2023-03-15 17:15:35.937885-07', 't'),
(19, 'take-off-with-elixir', 'Take Off with Elixir', '<p>Learn the high-powered, scalable, functional language that is taking the programming world by storm. Elixir is will change the way you write code! This video has been deprecated - I need to do some fixes to get it back up to speed.</p>', '<p>Learn the high-powered, scalable, functional language that is taking the programming world by storm. Elixir is will change the way you write code! This video has been deprecated - I need to do some fixes to get it back up to speed.</p>', '', '', '', '2023-03-15 17:15:35.938686-07', '2023-03-15 17:15:35.938686-07', 't'),
(1, 'imposter-video', 'Computer Science Fundamentals', '<p>Over <strong>6 hours of videos</strong> spread across <strong>72 individual lessons</strong>. You&#39;ll learn about Data Structures and Algorithms, Cryptography, Binary, Software Design and Essential Unix Skills. If you&#39;re a visual person and want to learn Core CS Concepts, this production is for you. This isn’t your typical &#39;<em>hey guys what’s up</em>&#39; YouTube crap either. I pride myself in <strong>concise delivery and tight editing</strong>.</p>
', 'Over 6 hours of videos spread across 72 individual lessons. You''ll learn about Data Structures and Algorithms, Cryptography, Binary, Software Design and Essential Unix Skills. The perfect compliment to The Imposter''s Handbook or just fine as a standalone course.', 'https://github.com/imposters-handbook/videos', 'https://github.com/imposters-handbook/videos/issues', '', '2023-03-15 17:15:35.87799-07', '2023-03-15 17:15:35.87799-07', 't'),
(20, 'accelerator', 'The Imposter''s Frontend Accelerator', 'In this production you''ll learn all about frontend web development using Vue 3.0 and Nuxt 3.0. You''ll get a book which covers the concepts as well as a set of 30 walkthrough videos where we build a real application in episodic format. In addition, you''ll get a set of case studies which tackle specific problems, such as porting from Vue 2 to Vue 3, Testing and integrating with Firebase.', '<p>It''s a book. It''s a video course... It''s both! You get a concise, conceptual approach to modern frontend web development with Vue 3.0 and Nuxt 3.0, as well as an episodic walkthrough where we build something real!<br></p>', 'https://github.com/robconery/nuxt-walkthrough', 'https://github.com/robconery/nuxt-walkthrough/discussions', NULL, '2023-06-07 09:51:37.171958-07', '2023-06-07 09:51:37.171958-07', 't'),
(5, 'going-solo', 'Going Out on Your Own as a Solo Programmer', '<p>Taking control of your career can be lifechanging – the freedom to work on what you want when you want is intoxicating. In 2004 I decided I was done working for other people - it was time to go out on my own. It&#39;s been fun... and challenging too. It’s really easy to screw the whole thing up if you don’t start with a solid plan. That’s why I made this course.</p>
', 'Take control of your career and build a business to set you free', 'https://github.com/bigmachine-io', 'https://github.com/bigmachine-io/site/discussions', '', '2023-03-15 17:15:35.921441-07', '2023-03-15 17:15:35.921441-07', 't'),
(11, 'mission-interview', 'Coding Interview Bootcamp', '<p>We&#39;ll start out by getting our heads in the right place: <em>interviewing can actually be fun!</em> Not only that, <strong>you meet some interesting people</strong> whom you&#39;ll likely cross paths with later in your career, and be introduced to (possibly) some very interesting companies. We&#39;ll then dig in and start <strong>reviewing and practicing</strong>, and we&#39;ll <strong>wind things up with Mr. Jon Skeet himself</strong>, who interviews people regularly for Google.</p>
', 'Trying to get in at one of the top tech companies in the world? If so, I have 5 hours of video for you, spread over 18 lessons. You''ll learn the strategies and techniques your peers use to get in and get paid a lot of money.', 'https://github.com/bigmachine-io/mission-interview', 'https://github.com/bigmachine-io/mission-interview/issues', '', '2023-03-15 17:15:35.930169-07', '2024-03-24 09:48:10.843653-07', 't');

DROP TABLE IF EXISTS lessons;

CREATE TABLE lessons (
    id serial primary key,
    course_id int4 NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    free bool NOT NULL DEFAULT false,
    summary text,
    description text,
    category text NOT NULL,
    index int4 NOT NULL DEFAULT 0,
    duration int4 NOT NULL DEFAULT 0,
    vimeo_id text,
    youtube_id text,
    github text,
    fa_icon text NOT NULL DEFAULT 'fa-play'::text,
    mdi_icon text NOT NULL DEFAULT 'mdi-play-circle-outline'::text,
    download_url text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    markdown text,
    gist text
);

INSERT INTO lessons (id, course_id, title, slug, free, summary, description, category, index, duration, vimeo_id, youtube_id, github, fa_icon, mdi_icon, download_url, created_at, updated_at, markdown, gist) VALUES
(1, 1, 'The Basics of Logic', 'basics-of-logic', 'f', 'Let’s jump right in at the only place we can: the very begining, diving into the perfectly obvious and terribly argumentative ''rules of logic''.', '<p>Let’s jump right in at the only place we can: <em>the very begining</em>. The programs we write every day are based on orchestrated algorithms and data structures that all have their roots in a single thing: <em>LOGIC</em>. Let’s quickly explore some basic logical rules as we’re going to build on them later on.</p>
<p><img src=https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977194623_screenshot_254.jpg alt=></p>
<h2 id=logic-what-exactly-is-it>Logic… What Exactly Is It?</h2>
<p>The first, most obvious is question is <em>how are we defining the term “logic”.</em>  There are a few different definitions so let’s start with the first, offered by Aristotle.
In trying to come up with a framework for thinking, Aristotle described what are known today as <em>The Laws of Thought.</em>
Let’s take a look at each one using JavaScript!</p>
<p>The first is The Law of Identity, which simply states that a bit of logic is whole unto itself - it’s either true, or false, and it will always be equal to itself.</p>
<p><img src=https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977478640_image.png alt=></p>
<p>Here we’re describing this as <code>x === x</code>, which… yes… I know seems perfectly obvious but stay with me.</p>
<p><img src=https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977610179_image.png alt=></p>
<p>The next law is called <em>The Law of Contradiction</em>, which states that a logical statement cannot be both true and false at the same time. Put another way - a true statement is never false, and a false statement is never true.</p>
<p><img src=https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977655176_image.png alt=></p>
<p>Again - this is perfectly reasonable and seems obvious. Let’s keep going with the third law: <em>Excluded Middle.</em></p>
<p>This one’s a bit more fun as it states that something can either be true or false - there is no in-between. Using JavaScript we can demonstrate this by setting <code>x</code> and <code>y</code> to true and false and playing around with different operations - the only thing that is returned, based on those operations, is <code>true</code> or <code>false</code> - that’s Excluded Middle in action.</p>
<p>And right about now some of you might be bristling at this. </p>
<h2 id=ternary-logic>Ternary Logic</h2>
<p>As I’ve been writing the statements above we’ve been seeing JavaScript evaluate the result of each, which has been <code>undefined</code>. The idea here is that there’s a third state, that’s neither true nor false - which is undefined. You can also think of this as <code>null</code> for now even though, yes, null and undefined are two different things. We’ll lump them together for the sake of defining what’s known as “ternary logic” - or “three state logic” which kicks Excluded Middle right in the teeth.</p>
<h2 id=problems>Problems</h2>
<p>Aristotle had a problem with his logical system - it only deals with things that are <em>known</em>. The only things we can know for sure are things that have happened already and that we have witnessed somehow… even then there’s a question of whether we truly know them. Let’s sidestep that rabbit hole.</p>
<p>When asked to apply his <em>Laws of Thought</em> to future events - such as “will Greece be invaded this year” Aristotle replied that logic cannot apply to future events as they are unknowable. An easy out, and also a lovely transition to Ternary Logic.</p>
<h2 id=determininism>Determininism</h2>
<p>Let’s bring this back to programming. You and I can muse all day about whether Aristotle’s brand of logic -  which we can call “binary” for now - is more applicable <em>or</em> whether the world can be better understood with the more flexible ternary logic. But I don’t want to do that because I’m here to talk about computer programming and for that there’s only one system that we can think about - a <em>deterministic</em> system.</p>
<p>If you read the first <em>Imposter’s Handbook</em> you’ll likely remember the chapter on determinism (and non-determinism). If not - a simple explanation is that a deterministic system means that every cause has an effect and there is no unknown.</p>
<p>Programs are <em>deterministic</em> because computers are deterministic. Every instruction that a computer is given is in the form of groups of 1s and 0s… there are no undefined middle points.
This is important to understand as we move forward - the math that we’re about to get into and the very advent of computer science is predicated on these ideas.
I know what you’re thinking though… </p>
<h2 id=what-about-null-none-nil-or-undefined>What About Null, None, Nil or Undefined?</h2>
<p>Programming languages define much more than simply true or false - they also include the ability to have something be neither in the forms of null, nil, none or undefined. So let me ask you a question… <em>is that logical</em>?</p>
<p>Let’s take a look.</p>
<p>By default, JavaScript (and many other languages) will default a variable to an unknown value such as null or, as you see here, undefined. If I ask JavaScript if something undefined is equal to itself, the answer is true. If it’s not equal to itself the answer is false - so good so far.</p>
<p>What about being equal to not-not itself? Well that’s false as well which makes a bit of distorted sense because <code>!y</code> is false so <code>!!y</code> returns true… I guess. But if something is <code>!undefined</code> … what is it? To JavaScript… it’s simply <code>true</code>.</p>
<p>We can short-circuit our brains thinking about this but let’s not… </p>
<h2 id=the-billion-dollar-blunder>The Billion Dollar Blunder</h2>
<p>The creator of ALGOL, Tony Hoare, is credited with creating the concept of <code>null</code> in a programming language:</p>
<blockquote>
<p>I call it my billion-dollar mistake…At that time, I was designing the first comprehensive type system for references in an object-oriented language. My goal was to ensure that all use of references should be absolutely safe, with checking performed automatically by the compiler. But I couldn’t resist the temptation to put in a null reference, simply because it was so easy to implement. This has led to innumerable errors, vulnerabilities, and system crashes, which have probably caused a billion dollars of pain and damage in the last forty years.</p>
</blockquote>
<p>Have you ever battled null problems in your code or tried to coerce an undefined value into some kind of truthy statement? We all do that every day.</p>
<p>Computers aren’t capable of understanding this. Programming languages are, apparently and at some point the two need to reconcile what <code>null</code> and <code>undefined</code> means. What makes this worse is that different languages behave differently.</p>
<h3 id=ruby>Ruby</h3>
<p>Ruby defines <code>null</code> as <code>nil</code> and has a formalized class, called <code>NilClass</code> for dealing with this unknowable value. If you try to involve <code>nil</code> in a logical statement, such as greater or less than 10, Ruby will throw an exception. This makes a kind of sense, I suppose, as comparing something unknown can be … anything really.</p>
<p>But what about coercion? As you can see here, <code>nil</code> will be evaluated to false and asking nil if it’s indeed nil will return true. But you can also convert nil to an array or an integer… which seems weird… and if you inspect nil you get a string back that says “nil”. We’ll just leave off there.</p>
<h3 id=javascript>JavaScript</h3>
<p>JavaScript is kind of a mess when it comes to handling <code>null</code> operations as it will try to do it’s best to give you some kind of answer without throwing an exception. <code>10 _ null</code> is 0, for instance… I dunno… </p>
<p>It’s the last two statements that will bend your brain, however, because <code>10 &lt;= null</code> is somehow false… but <code>10 &gt;= 0</code> is true. I know JavaScript fans out there will readily have an answer… good for them I’m sure there’s a way to explain this but honestly it’s not sensical to begin with because, as I’ve mentioned, <code>null</code> and <code>undefined</code> are abstractions on top of purely logical systems. Each language gets to invent it’s own rules.</p>
<p>If you ask JavaScript what type <code>null</code> is you’ll get <code>object</code> back - which isn’t true, as MDN states:</p>
<blockquote>
<p>In the first implementation of JavaScript, JavaScript values were represented as a type tag and a value. The type tag for objects was 0. null was represented as the NULL pointer (0x00 in most platforms). Consequently, null had 0 as type tag, hence the bogus typeof return value.</p>
</blockquote>
<h3 id=c>C#</h3>
<p>Let’s take a look at a more “structured” language - C#. You would think that a language like this would be a bit more strict about what you can do with Null… but it’s not! OK it DOES throw when you try to compare null to !!null - that’s a good thing, but when you try to do numeric comparisons… hmmm</p>
<p>And null + 10 is null? I dunno about that.</p>
<p><img src=https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586979913518_image.png alt=></p>
<h2 id=the-point>The Point</h2>
<p>So, what’s my point with this small dive into the world of logic and null? It is simply that <em>null is an abstraction defined by programming languages</em>. It (as well as undefined) has no place in the theory we’re about to dive into. We’re about to jump into the land of pure logic and mathematics, electronic switches that become digital… encoding… encryption and a bunch more - none of which have the idea of null or undefined.</p>
<p>It’s exciting stuff - let’s go!</p>
', 'Foundations', 0, 421, '417355007', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/417355007/0e6c95d3b6', '2023-03-19 09:49:30.050258-07', '2023-03-19 09:49:30.050258-07', 'Let’s jump right in at the only place we can: _the very begining_. The programs we write every day are based on orchestrated algorithms and data structures that all have their roots in a single thing: _LOGIC_. Let’s quickly explore some basic logical rules as we’re going to build on them later on.

![](https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977194623_screenshot_254.jpg)

## Logic… What Exactly Is It?

The first, most obvious is question is _how are we defining the term “logic”._  There are a few different definitions so let’s start with the first, offered by Aristotle.
In trying to come up with a framework for thinking, Aristotle described what are known today as _The Laws of Thought._
Let’s take a look at each one using JavaScript!

The first is The Law of Identity, which simply states that a bit of logic is whole unto itself - it’s either true, or false, and it will always be equal to itself.

![](https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977478640_image.png)


Here we’re describing this as `x === x`, which… yes… I know seems perfectly obvious but stay with me.

![](https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977610179_image.png)


The next law is called _The Law of Contradiction_, which states that a logical statement cannot be both true and false at the same time. Put another way - a true statement is never false, and a false statement is never true.

![](https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586977655176_image.png)


Again - this is perfectly reasonable and seems obvious. Let’s keep going with the third law: _Excluded Middle._

This one’s a bit more fun as it states that something can either be true or false - there is no in-between. Using JavaScript we can demonstrate this by setting `x` and `y` to true and false and playing around with different operations - the only thing that is returned, based on those operations, is `true` or `false` - that’s Excluded Middle in action.

And right about now some of you might be bristling at this. 

## Ternary Logic

As I’ve been writing the statements above we’ve been seeing JavaScript evaluate the result of each, which has been `undefined`. The idea here is that there’s a third state, that’s neither true nor false - which is undefined. You can also think of this as `null` for now even though, yes, null and undefined are two different things. We’ll lump them together for the sake of defining what’s known as “ternary logic” - or “three state logic” which kicks Excluded Middle right in the teeth.

## Problems

Aristotle had a problem with his logical system - it only deals with things that are _known_. The only things we can know for sure are things that have happened already and that we have witnessed somehow… even then there’s a question of whether we truly know them. Let’s sidestep that rabbit hole.

When asked to apply his _Laws of Thought_ to future events - such as “will Greece be invaded this year” Aristotle replied that logic cannot apply to future events as they are unknowable. An easy out, and also a lovely transition to Ternary Logic.

## Determininism

Let’s bring this back to programming. You and I can muse all day about whether Aristotle’s brand of logic -  which we can call “binary” for now - is more applicable _or_ whether the world can be better understood with the more flexible ternary logic. But I don’t want to do that because I’m here to talk about computer programming and for that there’s only one system that we can think about - a _deterministic_ system.

If you read the first _Imposter’s Handbook_ you’ll likely remember the chapter on determinism (and non-determinism). If not - a simple explanation is that a deterministic system means that every cause has an effect and there is no unknown.

Programs are _deterministic_ because computers are deterministic. Every instruction that a computer is given is in the form of groups of 1s and 0s… there are no undefined middle points.
This is important to understand as we move forward - the math that we’re about to get into and the very advent of computer science is predicated on these ideas.
I know what you’re thinking though… 

## What About Null, None, Nil or Undefined?

Programming languages define much more than simply true or false - they also include the ability to have something be neither in the forms of null, nil, none or undefined. So let me ask you a question… _is that logical_?

Let’s take a look.

By default, JavaScript (and many other languages) will default a variable to an unknown value such as null or, as you see here, undefined. If I ask JavaScript if something undefined is equal to itself, the answer is true. If it’s not equal to itself the answer is false - so good so far.

What about being equal to not-not itself? Well that’s false as well which makes a bit of distorted sense because `!y` is false so `!!y` returns true… I guess. But if something is `!undefined` … what is it? To JavaScript… it’s simply `true`.

We can short-circuit our brains thinking about this but let’s not… 

## The Billion Dollar Blunder

The creator of ALGOL, Tony Hoare, is credited with creating the concept of `null` in a programming language:

> I call it my billion-dollar mistake…At that time, I was designing the first comprehensive type system for references in an object-oriented language. My goal was to ensure that all use of references should be absolutely safe, with checking performed automatically by the compiler. But I couldn’t resist the temptation to put in a null reference, simply because it was so easy to implement. This has led to innumerable errors, vulnerabilities, and system crashes, which have probably caused a billion dollars of pain and damage in the last forty years.

Have you ever battled null problems in your code or tried to coerce an undefined value into some kind of truthy statement? We all do that every day.

Computers aren’t capable of understanding this. Programming languages are, apparently and at some point the two need to reconcile what `null` and `undefined` means. What makes this worse is that different languages behave differently.

### Ruby

Ruby defines `null` as `nil` and has a formalized class, called `NilClass` for dealing with this unknowable value. If you try to involve `nil` in a logical statement, such as greater or less than 10, Ruby will throw an exception. This makes a kind of sense, I suppose, as comparing something unknown can be … anything really.

But what about coercion? As you can see here, `nil` will be evaluated to false and asking nil if it’s indeed nil will return true. But you can also convert nil to an array or an integer… which seems weird… and if you inspect nil you get a string back that says “nil”. We’ll just leave off there.

### JavaScript

JavaScript is kind of a mess when it comes to handling `null` operations as it will try to do it’s best to give you some kind of answer without throwing an exception. `10 _ null` is 0, for instance… I dunno… 

It’s the last two statements that will bend your brain, however, because `10 <= null` is somehow false… but `10 >= 0` is true. I know JavaScript fans out there will readily have an answer… good for them I’m sure there’s a way to explain this but honestly it’s not sensical to begin with because, as I’ve mentioned, `null` and `undefined` are abstractions on top of purely logical systems. Each language gets to invent it’s own rules.

If you ask JavaScript what type `null` is you’ll get `object` back - which isn’t true, as MDN states:

> In the first implementation of JavaScript, JavaScript values were represented as a type tag and a value. The type tag for objects was 0. null was represented as the NULL pointer (0x00 in most platforms). Consequently, null had 0 as type tag, hence the bogus typeof return value.

### C#

Let’s take a look at a more “structured” language - C#. You would think that a language like this would be a bit more strict about what you can do with Null… but it’s not! OK it DOES throw when you try to compare null to !!null - that’s a good thing, but when you try to do numeric comparisons… hmmm

And null + 10 is null? I dunno about that.

![](https://paper-attachments.dropbox.com/s_2445305A04ABF7A4805787E7A50C17A793726EE3FAAADB10ED1EF4ECCCEFB23C_1586979913518_image.png)

## The Point

So, what’s my point with this small dive into the world of logic and null? It is simply that _null is an abstraction defined by programming languages_. It (as well as undefined) has no place in the theory we’re about to dive into. We’re about to jump into the land of pure logic and mathematics, electronic switches that become digital… encoding… encryption and a bunch more - none of which have the idea of null or undefined.

It’s exciting stuff - let’s go!
', NULL),
(2, 1, 'Boolean Algebra', 'boolean-algebra', 'f', 'You''re George Boole, a self-taught mathematician and somewhat of a genius. You want to know what God''s thinking so you decide to take Aristotle''s ideas of logic and go ''above and beyond'' to include mathematical proofs.', '<p>You&#39;re a mathematician and an ordained minister living in Ireland during the potato famine of the 1800s. People are starving and miserable and praying for help - you decide to try something different.</p>
<p><a href=https://thing>You&#39;re George Boole</a>, a self-taught mathematician and somewhat of a genius. You want to know what God&#39;s thinking so you decide to take Aristotle&#39;s ideas of logic and go &quot;above and beyond&quot; to include mathematical proofs.</p>
<p>You create an algebra of sorts, that deals strictly with true or false values. No numbers, variables or other nonsense: pure logical algebra.</p>
<h2 id=the-foundation-of-what-we-do>The Foundation of What We Do</h2>
<p>George Boole&#39;s work laid the foundation for modern programming as well as the digital chip. Engineers (namely Claude Shannon) would use his work, which remained mostly obscure until the 1920s, to create the digital circuit, something we&#39;ll do in the next video.</p>
<p>For now, enjoy this historical adventure into the birth of mathematical logic.</p>
', 'Foundations', 1, 930, '417355175', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/417355175/7834b89e64', '2023-03-19 09:49:30.083981-07', '2023-03-19 09:49:30.083981-07', 'You''re a mathematician and an ordained minister living in Ireland during the potato famine of the 1800s. People are starving and miserable and praying for help - you decide to try something different.

[You''re George Boole](https://thing), a self-taught mathematician and somewhat of a genius. You want to know what God''s thinking so you decide to take Aristotle''s ideas of logic and go above and beyond to include mathematical proofs.

You create an algebra of sorts, that deals strictly with true or false values. No numbers, variables or other nonsense: pure logical algebra.

## The Foundation of What We Do
George Boole''s work laid the foundation for modern programming as well as the digital chip. Engineers (namely Claude Shannon) would use his work, which remained mostly obscure until the 1920s, to create the digital circuit, something we''ll do in the next video.

For now, enjoy this historical adventure into the birth of mathematical logic.
', NULL),
(3, 1, 'Binary Mathematics', 'binary-math', 't', 'This is a famous interview question: ''write a routine that adds two positive integers and do it without using mathematic operators''. Turns out you can do this using binary!', '<p>There are a lot of things that I don&#39;t know in Computer Science but if there was a King of Things I Don&#39;t Know, it would be &quot;binary stuff&quot;. I was so scared of this topic that I avoided it completely with the first Imposter&#39;s Handbook.</p>
<p>You&#39;re about to see why. This is stuff (to me, at least) is simplistically mind-bending! I understand how to add and how to carry numbers - and it makes sense that you should be able to translate that directly to binary... and you can! </p>
<p>And then... things get a bit more difficult. I did my best with this video to make things as clear and simple as I could - I hope you enjoy.</p>
', 'Logic and Binary', 2, 889, '417355393', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/417355393/805cd067d7', '2023-03-19 09:49:30.086169-07', '2023-03-19 09:49:30.086169-07', 'There are a lot of things that I don''t know in Computer Science but if there was a King of Things I Don''t Know, it would be binary stuff. I was so scared of this topic that I avoided it completely with the first Imposter''s Handbook.

You''re about to see why. This is stuff (to me, at least) is simplistically mind-bending! I understand how to add and how to carry numbers - and it makes sense that you should be able to translate that directly to binary... and you can! 

And then... things get a bit more difficult. I did my best with this video to make things as clear and simple as I could - I hope you enjoy.
', NULL),
(4, 1, 'Bitwise Operators', 'bitwise-operations', 'f', 'Up until now we''ve been representing binary values as strings so we could see what''s going on. It''s time now to change that and get into some real binary operations.', '<p>All of the logic gates we&#39;ve been using (AND, XOR, OR, etc) are part of every programming languages as bitwise operators. You&#39;ve probably seen them before - here they are in JavaScript:</p>
<ul>
<li><code>&amp;</code> is AND</li>
<li><code>||</code> is OR</li>
<li><code>^</code> is XOR</li>
</ul>
<p>And so on. In this video we dive in head-first and answer a pretty common interview question:</p>
<blockquote>
<p>Create a routine that adds two positive integers together without using mathematic operators.</p>
</blockquote>
<p>I got asked this once and drew a complete blank as I had no idea and let the interviewer know that. They tried to offer me clues but I was beyond any kind of help, in a completely foreign land. I knew absolutely nothing about binary!</p>
<p>If this is you, buckle up cause here we go!</p>
<h2 id=the-code>The Code</h2>
<p>Here&#39;s the code we&#39;ll be cycling on for the video:</p>
<pre><code class=language-js>const add =function(x,y) {
  //iterate until there is no carry
  let should_carry = null;
  while(should_carry !== 0){
    should_carry = x &amp; y;
    x = x ^ y;
    y = should_carry &lt;&lt; 1;
  }
  return x;
}
console.log(add(27,15));
</code></pre>
', 'Logic and Binary', 3, 889, '417355478', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/417355478/37f1ba3ddf', '2023-03-19 09:49:30.087555-07', '2023-03-19 09:49:30.087555-07', 'All of the logic gates we''ve been using (AND, XOR, OR, etc) are part of every programming languages as bitwise operators. You''ve probably seen them before - here they are in JavaScript:

 - `&` is AND
 - `||` is OR
 - `^` is XOR

And so on. In this video we dive in head-first and answer a pretty common interview question:

> Create a routine that adds two positive integers together without using mathematic operators.

I got asked this once and drew a complete blank as I had no idea and let the interviewer know that. They tried to offer me clues but I was beyond any kind of help, in a completely foreign land. I knew absolutely nothing about binary!

If this is you, buckle up cause here we go!

## The Code

Here''s the code we''ll be cycling on for the video:

```js
const add =function(x,y) {
  //iterate until there is no carry
  let should_carry = null;
  while(should_carry !== 0){
    should_carry = x & y;
    x = x ^ y;
    y = should_carry << 1;
  }
  return x;
}
console.log(add(27,15));
```
', NULL),
(5, 1, 'Logical Negation', 'logical-negation', 'f', 'We''ve covered how to add binary numbers together, but how do you subtract them? For that, you need a system for recognizing a number as negative and a few extra rules. Those rules are one''s and two''s complement.', '<p>This is where things get a bit weird. Binary has only two digits: a 1 and a 0, <em>nothing else</em>. So how do you represent a negative number? It turns out we have two ways of doing this.</p>
<h2 id=ones-complement>One&#39;s Complement</h2>
<p>In decimal you sutract a number (let&#39;s say it&#39;s <code>y</code>) from another number (let&#39;s say it&#39;s <code>x</code>) by inverting it and then peforiming addition:</p>
<pre><code class=language-sh>z = x + -y
</code></pre>
<p>Inverting a number in decimal is signified by using the <code>-</code> sign operator. This equation is a bit noisy, however, so we tend to write it in the simpler form <code>x-y</code>. We can do the exact same in binary, <em>sort of</em>, by inverting (or &quot;flipping&quot;) a binary number to get it&#39;s complement.</p>
<p>Flipping is a straightforward thing: whenever you see a 1 you replace it with a 0 and vice-versa. That&#39;s what one&#39;s complement is: <em>inverting</em> and then signing a number. To &quot;sign&quot; a number in binary means setting the left-most bit to either a 0 (positive) or 1 (negative).</p>
<p>The one&#39;s complement of a binary 1 (<code>01</code>), therefore, is <code>110</code>. It looks a bit weird and takes some getting used to, but it works.</p>
<p>We can now perform subtraction. Let&#39;s try 1 - 1 in binary. Remember, the left-most digit is the sign:</p>
<pre><code class=language-sh>001
110
---
111
</code></pre>
<p>Our answer is 111, which is the binary representation of zero. Which is weird because the binary representation of zero is also <code>000</code> and, as it turns out, there are <em>two representations of zero</em> in one&#39;s complement. Which sucks and is confusing.</p>
<p>There&#39;s a mathematical reason why which is in the video.</p>
<h2 id=twos-complement>Two&#39;s Complement</h2>
<p>We need to do a little more work to get everything line up the way we want, which is where <em>two&#39;s complement</em> comes in. It&#39;s the same as one&#39;s complement, but you just <strong>add one</strong> to get over that negative zero thing. Sounds kind of goofy, but it works:</p>
<pre><code class=language-sh>001
110
001
---
000
</code></pre>
<p>You&#39;ll notice here that there&#39;s a carry as the last operation and that, if we&#39;re sticking to the rules, the answer should really be <code>1000</code>. Why isn&#39;t it?</p>
<h2 id=no-last-carry-in-twos-complement>No Last Carry in Two&#39;s Complement</h2>
<p>The simple reason is that we&#39;ve already accounted for the carry in two&#39;s complement by adding one. Nice and tidy. So: if there&#39;s a carry, you can just ignore it.</p>
', 'Logic and Binary', 4, 660, '422244638', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/422244638/e67747f46a', '2023-03-19 09:49:30.090023-07', '2023-03-19 09:49:30.090023-07', 'This is where things get a bit weird. Binary has only two digits: a 1 and a 0, _nothing else_. So how do you represent a negative number? It turns out we have two ways of doing this.

## One''s Complement

In decimal you sutract a number (let''s say it''s `y`) from another number (let''s say it''s `x`) by inverting it and then peforiming addition:

```sh
z = x + -y
```

Inverting a number in decimal is signified by using the `-` sign operator. This equation is a bit noisy, however, so we tend to write it in the simpler form `x-y`. We can do the exact same in binary, _sort of_, by inverting (or flipping) a binary number to get it''s complement.

Flipping is a straightforward thing: whenever you see a 1 you replace it with a 0 and vice-versa. That''s what one''s complement is: _inverting_ and then signing a number. To sign a number in binary means setting the left-most bit to either a 0 (positive) or 1 (negative).

The one''s complement of a binary 1 (`01`), therefore, is `110`. It looks a bit weird and takes some getting used to, but it works.

We can now perform subtraction. Let''s try 1 - 1 in binary. Remember, the left-most digit is the sign:

```sh
001
110
---
111
```

Our answer is 111, which is the binary representation of zero. Which is weird because the binary representation of zero is also `000` and, as it turns out, there are _two representations of zero_ in one''s complement. Which sucks and is confusing.

There''s a mathematical reason why which is in the video.

## Two''s Complement

We need to do a little more work to get everything line up the way we want, which is where _two''s complement_ comes in. It''s the same as one''s complement, but you just **add one** to get over that negative zero thing. Sounds kind of goofy, but it works:

```sh
001
110
001
---
000
```

You''ll notice here that there''s a carry as the last operation and that, if we''re sticking to the rules, the answer should really be `1000`. Why isn''t it?

## No Last Carry in Two''s Complement

The simple reason is that we''ve already accounted for the carry in two''s complement by adding one. Nice and tidy. So: if there''s a carry, you can just ignore it.
', NULL),
(6, 1, 'Entropy and Quantifying Information', 'entropy', 'f', 'Now that we know how to use binary to create switches and digitally represent information we need to ask the obvious question: ''is this worthwhile''? Are we improving things and if so, how much?', '<p>Back in the early 1900s electrical engineers were focused on a problem: <em>how can we send more information, faster</em>. This was, of course, of major interest to the military as it allowed for faster response and better coordination.</p>
<h2 id=speed-and-communication-in-the-1900s>Speed and Communication in the 1900s</h2>
<p>If you wanted to send information across long distances you did it using a telegraph and Morse code. A message was encoded using a series of beeps and, on the receiving end, the receiver would listen to those beeps and decode them. If you had two very good telegraphers you could trasmit 10 - 15 words a minute.</p>
<p>Not very fast, especially when 5 of those words not essential to the information in the message itself:</p>
<blockquote>
<p>REGRET TO INFORM YOU YOUR BARN BURNED DOWN DURING THE NIGHT | YOUR COWS ARE SAVED | THE PIGS WERE LOST</p>
</blockquote>
<h2 id=the-message>The Message</h2>
<p>Sending information from one point to another involves a few terms we need to get to know:</p>
<ul>
<li>A <strong>sender</strong> sends the information over a </li>
<li><strong>Channel</strong> to a </li>
<li><strong>Receiver</strong> using a </li>
<li><strong>Transmitter</strong></li>
<li>The information is contained in a <strong>message</strong></li>
</ul>
<p>In the message above, the receiver is informed that their barn burned down, which is something the receiver didn&#39;t know prior to receiving the message. Here&#39;s another message that might follow:</p>
<blockquote>
<p>WEATHER CLEAR TODAY IN THE 70s WITH SLIGHT CHANCE OF RAIN | CLEANUP SHOULD BE CARRIED WITHOUT PROBLEM</p>
</blockquote>
<p>These two messages contain roughly the same number of characters but one message is a bit more impactful, or <em>surprising</em> than the other. Learning that your barned burned down has much more impact (and therefore more information) than a mundane weather report. But how much more?</p>
<h2 id=all-possible-messages>All Possible Messages</h2>
<p>If you lived in the early 1900s and stood next to your telegraph, staring at it, you would receive a number of messages:</p>
<ul>
<li><strong>Nothing</strong>. Believe it or not, something <em>not</em> happening is information too! There are nearly infinite possibilities of a particular thing happening in the future, some more probable than others (which is important to us - we&#39;ll come back to that). When <em>nothing</em> happens, that&#39;s not surprising at all and therefore contains very little information.</li>
<li>A message comes in with the weather report. &quot;Yes yes&quot; you think, &quot;I can see outside and I can tell it&#39;ll be a cloudy day&quot;. That message does contain information, but not very much. Of all the possible messages that could come in, that was the most predictable.</li>
<li>Later that day you get another message, explaining that it wasn&#39;t your barn that burned down, it was your neighbors! This has a TON of information! You didn&#39;t expect this at all (though maybe you hoped for it because you hate your neighbor).</li>
</ul>
<p>Messages don&#39;t <em>just happen</em>, they are &quot;pulled from the chaos&quot; of all possible things that could happen. This is the main definition of a message that we&#39;ll be working on from here on out:</p>
<ul>
<li>It marks the intersection of probability to causality. Future to past. The one, finite thing that <em>happened</em> out of all possible things.</li>
<li>It defines how much you learned after receiving the message.</li>
</ul>
<p>It turns out that this is the key to quantifying information.</p>
<h2 id=entropy>Entropy</h2>
<p>Entropy is the &quot;degree of randomness&quot; of a system. If we&#39;re talking about a binary system (1s and 0s) there is very little entropy: something can be a 1 or a 0. If we&#39;re talking about a message in Morse code there&#39;s a bit more entropy because we have 26 uppercase alpha-numeric characters, 10 digits and a space.</p>
<p>If the message is in the English language, there are 240,000 possible words. We can pare that down a bit to &quot;common words&quot; which brings it to more like 20 or 30,000. Either way - the degree of randomness tells us a lot.</p>
<p>The idea is a simple one: <em>the greater the entropy, the greater the information a message contains</em>. This only works, however, if we separate the <em>meaning</em> of a message from the information it contains. Yes, it&#39;s sad if your barn burns down! It&#39;s the chance of you reading those words, however, that define the information.</p>
<p><em>Fire, cows saved, pigs lost</em>.</p>
<p>Those words, in that order, have a very low probability and thus a high amount of information. Ralph Hartley, the first engineer to try to calculate the speed of information, gave us the very first equation to express this idea:</p>
<pre><code class=language-sh>H(M) = log |M|
</code></pre>
<p>The entropy, <code>H</code>, of a message <code>M</code> is equal to the <code>log</code> of all possible messages from that system <code>|M|</code>. In the case of our barn burning down, &quot;all possible messages&quot; would be the 240,000 words in the English language.</p>
<p>To calculate the entropy of this message we simply need to multiply the entropy of each word. If I tell you your barn burned down, that&#39;s 4 words, or individual messages that make up the whole:</p>
<pre><code class=language-sh>H(&quot;YOUR BARN BURNED DOWN&quot;) = log(240000) * 4
</code></pre>
<p><img src=https://paper-attachments.dropbox.com/s_F26D2570458232DEA699952538884121E501B5D2CFD00A8E735F7510100DA88D_1591133506172_shot_318.jpg alt=Entropy of Your Barn Burning></p>
<p>That gives us &quot;21 Hartleys&quot; of information, a unit of measure you&#39;ve probably not heard before. Me neither. But that&#39;s not really the weird thing here.</p>
<p>We have a bigger problem, which is that I could have said &quot;THE SKY IS BLUE&quot; and, using Hartley&#39;s equation, that would contain the exact same amount of information as &quot;YOUR BARN BURNED DOWN&quot;, which is absolutely not the case.</p>
<h2 id=the-shannon-entropy>The Shannon Entropy</h2>
<p>This is where we get to meet Claude Shannon again, who expanded on Hartley&#39;s idea, taking into account the <em>probability</em> of each message. To Shannon, the amount of information in a message is inversely related to its probability - something Shannon called the &quot;surprise&quot; of a message.</p>
<p>That, Shannon reasoned, is the true measure of information and he calculated it using a simple probability equation:</p>
<pre><code class=language-sh>s(M) = log2(1/p(M))
</code></pre>
<p>The surprise, <code>s</code> of a given message <code>M</code> is equal to the log (base 2) of 1/p(M). Why log 2? Because Shannon was working in the world of digital communication, sending messages using binary meant that the 1 or 0 was the correct way of thinking about (and quantifying) information. </p>
<p>So, the surprise of the message &quot;YOUR BARN BURNED DOWN&quot; is directly tied to the probability of each of those words coming in. &quot;YOUR&quot; is pretty normal, &quot;BARN&quot; isn&#39;t all that common but following &quot;YOUR&quot; it&#39;s not unexpected. &quot;BURNED&quot; is extremely unexpected but, once again, the word &quot;DOWN&quot; is <em>not</em>, because it follows the word &quot;BURNED&quot;.</p>
<p>To Shannon, the words &quot;YOUR&quot; and &quot;DOWN&quot; would be <em>redundant</em> in this message and could likely be stripped out, conveying close to the same idea: &quot;BARN BURNED&quot;. Not exactly the same as there is a bit of ambiguity, but this is a very important breakthrough!</p>
<p><em>Shannon gave us a way to think about shortening a message without losing too much information</em>. Shorter messages means more efficient transmission! Brilliant!</p>
<p>This led to Shannon&#39;s Entropy equation, which is one of the most important equations ever produced:</p>
<p><img src=https://paper-attachments.dropbox.com/s_F26D2570458232DEA699952538884121E501B5D2CFD00A8E735F7510100DA88D_1591134192302_shot_320.jpg alt=Shannon&#39;s Entropy></p>
<h2 id=the-seeds-of-data-compression>The Seeds of Data Compression</h2>
<p>If all of this has seemed academic up until now, this is where it all gets real. We use data compression every day - from GZIP on web pages to image compression in our texts. It all started right here with Claude Shannon&#39;s realization that words could be stripped from a message without altering its information.</p>
<p>We&#39;ll get to that in the next video.</p>
', 'Information Theory', 5, 968, '424599577', NULL, '732679a222842f6a1c2aa0f7e0ce9139', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/424599577/aadbca4603', '2023-03-19 09:49:30.103366-07', '2023-03-19 09:49:30.103366-07', 'Back in the early 1900s electrical engineers were focused on a problem: _how can we send more information, faster_. This was, of course, of major interest to the military as it allowed for faster response and better coordination.

## Speed and Communication in the 1900s

If you wanted to send information across long distances you did it using a telegraph and Morse code. A message was encoded using a series of beeps and, on the receiving end, the receiver would listen to those beeps and decode them. If you had two very good telegraphers you could trasmit 10 - 15 words a minute.

Not very fast, especially when 5 of those words not essential to the information in the message itself:

> REGRET TO INFORM YOU YOUR BARN BURNED DOWN DURING THE NIGHT | YOUR COWS ARE SAVED | THE PIGS WERE LOST

## The Message

Sending information from one point to another involves a few terms we need to get to know:

 - A **sender** sends the information over a 
 - **Channel** to a 
 - **Receiver** using a 
 - **Transmitter**
 - The information is contained in a **message**

In the message above, the receiver is informed that their barn burned down, which is something the receiver didn''t know prior to receiving the message. Here''s another message that might follow:

> WEATHER CLEAR TODAY IN THE 70s WITH SLIGHT CHANCE OF RAIN | CLEANUP SHOULD BE CARRIED WITHOUT PROBLEM

These two messages contain roughly the same number of characters but one message is a bit more impactful, or _surprising_ than the other. Learning that your barned burned down has much more impact (and therefore more information) than a mundane weather report. But how much more?

## All Possible Messages

If you lived in the early 1900s and stood next to your telegraph, staring at it, you would receive a number of messages:

 - **Nothing**. Believe it or not, something _not_ happening is information too! There are nearly infinite possibilities of a particular thing happening in the future, some more probable than others (which is important to us - we''ll come back to that). When _nothing_ happens, that''s not surprising at all and therefore contains very little information.
 - A message comes in with the weather report. Yes yes you think, I can see outside and I can tell it''ll be a cloudy day. That message does contain information, but not very much. Of all the possible messages that could come in, that was the most predictable.
 - Later that day you get another message, explaining that it wasn''t your barn that burned down, it was your neighbors! This has a TON of information! You didn''t expect this at all (though maybe you hoped for it because you hate your neighbor).

Messages don''t _just happen_, they are pulled from the chaos of all possible things that could happen. This is the main definition of a message that we''ll be working on from here on out:

 - It marks the intersection of probability to causality. Future to past. The one, finite thing that _happened_ out of all possible things.
 - It defines how much you learned after receiving the message.

It turns out that this is the key to quantifying information.

## Entropy

Entropy is the degree of randomness of a system. If we''re talking about a binary system (1s and 0s) there is very little entropy: something can be a 1 or a 0. If we''re talking about a message in Morse code there''s a bit more entropy because we have 26 uppercase alpha-numeric characters, 10 digits and a space.

If the message is in the English language, there are 240,000 possible words. We can pare that down a bit to common words which brings it to more like 20 or 30,000. Either way - the degree of randomness tells us a lot.

The idea is a simple one: _the greater the entropy, the greater the information a message contains_. This only works, however, if we separate the _meaning_ of a message from the information it contains. Yes, it''s sad if your barn burns down! It''s the chance of you reading those words, however, that define the information.

_Fire, cows saved, pigs lost_.

Those words, in that order, have a very low probability and thus a high amount of information. Ralph Hartley, the first engineer to try to calculate the speed of information, gave us the very first equation to express this idea:

```sh
H(M) = log |M|
```

The entropy, `H`, of a message `M` is equal to the `log` of all possible messages from that system `|M|`. In the case of our barn burning down, all possible messages would be the 240,000 words in the English language.

To calculate the entropy of this message we simply need to multiply the entropy of each word. If I tell you your barn burned down, that''s 4 words, or individual messages that make up the whole:

```sh
H(YOUR BARN BURNED DOWN) = log(240000) * 4
```


![Entropy of Your Barn Burning](https://paper-attachments.dropbox.com/s_F26D2570458232DEA699952538884121E501B5D2CFD00A8E735F7510100DA88D_1591133506172_shot_318.jpg)

That gives us 21 Hartleys of information, a unit of measure you''ve probably not heard before. Me neither. But that''s not really the weird thing here.

We have a bigger problem, which is that I could have said THE SKY IS BLUE and, using Hartley''s equation, that would contain the exact same amount of information as YOUR BARN BURNED DOWN, which is absolutely not the case.

## The Shannon Entropy

This is where we get to meet Claude Shannon again, who expanded on Hartley''s idea, taking into account the _probability_ of each message. To Shannon, the amount of information in a message is inversely related to its probability - something Shannon called the surprise of a message.

That, Shannon reasoned, is the true measure of information and he calculated it using a simple probability equation:

```sh
s(M) = log2(1/p(M))
```

The surprise, `s` of a given message `M` is equal to the log (base 2) of 1/p(M). Why log 2? Because Shannon was working in the world of digital communication, sending messages using binary meant that the 1 or 0 was the correct way of thinking about (and quantifying) information. 

So, the surprise of the message YOUR BARN BURNED DOWN is directly tied to the probability of each of those words coming in. YOUR is pretty normal, BARN isn''t all that common but following YOUR it''s not unexpected. BURNED is extremely unexpected but, once again, the word DOWN is _not_, because it follows the word BURNED.

To Shannon, the words YOUR and DOWN would be _redundant_ in this message and could likely be stripped out, conveying close to the same idea: BARN BURNED. Not exactly the same as there is a bit of ambiguity, but this is a very important breakthrough!

_Shannon gave us a way to think about shortening a message without losing too much information_. Shorter messages means more efficient transmission! Brilliant!

This led to Shannon''s Entropy equation, which is one of the most important equations ever produced:

![Shannon''s Entropy](https://paper-attachments.dropbox.com/s_F26D2570458232DEA699952538884121E501B5D2CFD00A8E735F7510100DA88D_1591134192302_shot_320.jpg)

## The Seeds of Data Compression

If all of this has seemed academic up until now, this is where it all gets real. We use data compression every day - from GZIP on web pages to image compression in our texts. It all started right here with Claude Shannon''s realization that words could be stripped from a message without altering its information.

We''ll get to that in the next video.
', NULL),
(7, 1, 'Encoding and Lossless Compression', 'encoding-lossless-compression', 'f', 'Claude Shannon showed us how to change the way we encode things in order to increase efficiency and speed up information trasmission. We see how in this video.', '<p>We&#39;re getting deep into the theory now, aren&#39;t we! Al this talk about entropy and surprise... what good does it actually do us! Turns out - a lot!</p>
<p>Claude Shannon (yes, him again!) recognized the connection between entropy, surprise, redundancy (extra useless information) and efficiency. In this video we get into the math to show how you can restructure your message encoding using simple math and a very clever probability equation to perform lossless compression - that means stripping out needless 1s and 0s without losing any part of your message.</p>
', 'Information Theory', 6, 1650, '435514850', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/435514850/5ff47f4bdb', '2023-03-19 09:49:30.10785-07', '2023-03-19 09:49:30.10785-07', 'We''re getting deep into the theory now, aren''t we! Al this talk about entropy and surprise... what good does it actually do us! Turns out - a lot!

Claude Shannon (yes, him again!) recognized the connection between entropy, surprise, redundancy (extra useless information) and efficiency. In this video we get into the math to show how you can restructure your message encoding using simple math and a very clever probability equation to perform lossless compression - that means stripping out needless 1s and 0s without losing any part of your message.
', NULL),
(8, 1, 'Error Correction, Part 1', 'error-correction-part-1', 'f', 'There are *always* errors during the transmission of information, digital or otherwise. Whether it''s written (typos, illegible writing), spoken (mumbling, environment noise) or digital (flipped bits), we have to account for and fix these problems.', '<p>As you watch this video, note that it&#39;s not always smooth and seamless. Behind the scenes, Vimeo (my video provider) is adjusting for bandwith changes, alternating the sources based on throughput. The player is compensating for packet loss as well, correcting for errors in audio and video.</p>
<p>This stuff is complicated and you&#39;re about to see why.</p>
<p>This is part 1 of a 2-part series where we try to answer two simple questions:</p>
<ul>
<li>Was there an error in the transmission?</li>
<li>Where is it?</li>
<li>This is tricky stuff! We&#39;ll tackle the theory in this video and in the next one, part 2, we&#39;ll spend the entire time writing the code necessary to fix my favorite Big Lebowski quote.</li>
</ul>
<h2 id=the-code>The Code</h2>
<p>Here&#39;s the code used in the video. Note that the blurbs below are mostly for example. In the next video we&#39;ll write more useful stuff.</p>
<pre><code class=language-js><span class=hljs-keyword>class</span> <span class=hljs-title class_>Encoder</span>{

  <span class=hljs-title function_>constructor</span>(<span class=hljs-params></span>){

    <span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span> = {
      <span class=hljs-string>&quot;A&quot;</span> : <span class=hljs-string>&quot;01000000000&quot;</span>,
      <span class=hljs-string>&quot;B&quot;</span> : <span class=hljs-string>&quot;10000000000&quot;</span>,
      <span class=hljs-string>&quot;C&quot;</span> : <span class=hljs-string>&quot;00100000000&quot;</span>,
      <span class=hljs-string>&quot;D&quot;</span> : <span class=hljs-string>&quot;00101000000&quot;</span>,
      <span class=hljs-string>&quot;E&quot;</span> : <span class=hljs-string>&quot;10100000000&quot;</span>,
      <span class=hljs-string>&quot;F&quot;</span> : <span class=hljs-string>&quot;10010000000&quot;</span>,
      <span class=hljs-string>&quot;G&quot;</span> : <span class=hljs-string>&quot;01010000000&quot;</span>,
      <span class=hljs-string>&quot;H&quot;</span> : <span class=hljs-string>&quot;11000000000&quot;</span>,
      <span class=hljs-string>&quot;I&quot;</span> : <span class=hljs-string>&quot;11010000000&quot;</span>,
      <span class=hljs-string>&quot;J&quot;</span> : <span class=hljs-string>&quot;01011000000&quot;</span>,
      <span class=hljs-string>&quot;K&quot;</span> : <span class=hljs-string>&quot;01011001000&quot;</span>,
      <span class=hljs-string>&quot;L&quot;</span> : <span class=hljs-string>&quot;10001000000&quot;</span>,
      <span class=hljs-string>&quot;M&quot;</span> : <span class=hljs-string>&quot;01010100000&quot;</span>,
      <span class=hljs-string>&quot;N&quot;</span> : <span class=hljs-string>&quot;01100000000&quot;</span>,
      <span class=hljs-string>&quot;O&quot;</span> : <span class=hljs-string>&quot;01110000000&quot;</span>,
      <span class=hljs-string>&quot;P&quot;</span> : <span class=hljs-string>&quot;10000100000&quot;</span>,
      <span class=hljs-string>&quot;Q&quot;</span> : <span class=hljs-string>&quot;01011000100&quot;</span>,
      <span class=hljs-string>&quot;R&quot;</span> : <span class=hljs-string>&quot;11100000000&quot;</span>,
      <span class=hljs-string>&quot;S&quot;</span> : <span class=hljs-string>&quot;11110000000&quot;</span>,
      <span class=hljs-string>&quot;T&quot;</span> : <span class=hljs-string>&quot;00110000000&quot;</span>,
      <span class=hljs-string>&quot;U&quot;</span> : <span class=hljs-string>&quot;10011000000&quot;</span>,
      <span class=hljs-string>&quot;V&quot;</span> : <span class=hljs-string>&quot;01011010000&quot;</span>,
      <span class=hljs-string>&quot;W&quot;</span> : <span class=hljs-string>&quot;00100100000&quot;</span>,
      <span class=hljs-string>&quot;X&quot;</span> : <span class=hljs-string>&quot;01011000110&quot;</span>,
      <span class=hljs-string>&quot;Y&quot;</span> : <span class=hljs-string>&quot;01011100000&quot;</span>,
      <span class=hljs-string>&quot;Z&quot;</span> : <span class=hljs-string>&quot;01011000111&quot;</span>,
      <span class=hljs-string>&quot; &quot;</span> : <span class=hljs-string>&quot;00000000000&quot;</span>
    }
  }
  <span class=hljs-title function_>encode</span>(<span class=hljs-params>message</span>){
    <span class=hljs-comment>//loop the characters in the message</span>
    <span class=hljs-comment>//we&#x27;ll assume for now that they won&#x27;t enter anything but alpha numeric with a space for separation</span>
    <span class=hljs-comment>//also ... uppercase to reduce pain</span>
    <span class=hljs-keyword>const</span> words = message.<span class=hljs-title function_>toUpperCase</span>(), out = [];

    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> word <span class=hljs-keyword>of</span> words){
      <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> char <span class=hljs-keyword>of</span> word){
        <span class=hljs-keyword>const</span> encoding = <span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span>[char];
        <span class=hljs-comment>//if the character can be encoded great. If not, ignore</span>
        <span class=hljs-keyword>if</span>(encoding) out.<span class=hljs-title function_>push</span>(encoding);
      }
    }
    <span class=hljs-keyword>return</span> out.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>);
  }   
  <span class=hljs-comment>//add the methods below</span>
}
</code></pre>
<pre><code class=language-js>  <span class=hljs-title function_>evenParity</span>(<span class=hljs-params></span>){
    <span class=hljs-keyword>const</span> keys = <span class=hljs-title class_>Object</span>.<span class=hljs-title function_>keys</span>(<span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span>);
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> key <span class=hljs-keyword>of</span> keys){
      <span class=hljs-comment>//default to even</span>
      <span class=hljs-keyword>let</span> pad = <span class=hljs-string>&quot;0&quot;</span>;
      <span class=hljs-comment>//split into a character array so we can filter</span>
      <span class=hljs-keyword>const</span> chars = <span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span>[key].<span class=hljs-title function_>split</span>(<span class=hljs-string>&#x27;&#x27;</span>);
      <span class=hljs-keyword>const</span> ones = chars.<span class=hljs-title function_>filter</span>(<span class=hljs-function><span class=hljs-params>v</span> =&gt;</span> v === <span class=hljs-string>&quot;1&quot;</span>);
      <span class=hljs-comment>//check mod 2 to see if we&#x27;re odd, if so, set the pad to 1</span>
      <span class=hljs-keyword>if</span>(ones.<span class=hljs-property>length</span> % <span class=hljs-number>2</span> !==<span class=hljs-number>0</span>) pad = <span class=hljs-string>&quot;1&quot;</span>
      <span class=hljs-comment>//update the encoding with a pad at the end</span>
      <span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span>[key]+= pad;
    }
    <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span>);
  }
</code></pre>
<pre><code class=language-js>  <span class=hljs-title function_>checkParity</span>(<span class=hljs-params>word</span>){
    <span class=hljs-comment>//make sure we have the right length</span>
    <span class=hljs-keyword>if</span>(word.<span class=hljs-property>length</span> !== <span class=hljs-number>12</span>) <span class=hljs-keyword>return</span> <span class=hljs-literal>false</span>;
    <span class=hljs-comment>//now make sure it&#x27;s even</span>
    <span class=hljs-keyword>return</span> word.<span class=hljs-title function_>split</span>(<span class=hljs-string>&quot;&quot;</span>).<span class=hljs-title function_>filter</span>(<span class=hljs-function><span class=hljs-params>char</span> =&gt;</span> char === <span class=hljs-string>&quot;1&quot;</span>).<span class=hljs-property>length</span> %<span class=hljs-number>2</span> === <span class=hljs-number>0</span>;
  }
</code></pre>
<pre><code class=language-js>  <span class=hljs-title function_>decode</span>(<span class=hljs-params>binaryMessage</span>){
    <span class=hljs-keyword>let</span> out = [], codeWord = <span class=hljs-string>&quot;&quot;</span>;
    <span class=hljs-keyword>const</span> pad = <span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span>.<span class=hljs-property>A</span>.<span class=hljs-property>length</span>;
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> i = <span class=hljs-number>0</span>; i &lt; binaryMessage.<span class=hljs-property>length</span>; i+=pad){
      codeWord = binaryMessage.<span class=hljs-title function_>substring</span>(i, i + pad);
      <span class=hljs-keyword>const</span> noError = <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>checkParity</span>(codeWord);
    
      <span class=hljs-keyword>if</span>(noError){
        <span class=hljs-keyword>const</span> key = <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>getAlpha</span>(codeWord);
        out.<span class=hljs-title function_>push</span>(key);
        codeWord = <span class=hljs-string>&quot;&quot;</span>;
      }<span class=hljs-keyword>else</span>{
        <span class=hljs-comment>//this is an error!</span>
        <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Got an error with &quot;</span>, codeWord);
        <span class=hljs-keyword>const</span> fix = <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>simpleHammingErrorCorrector</span>(codeWord);
        <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Fixing with best guess:&quot;</span>, fix);
        out.<span class=hljs-title function_>push</span>(fix.<span class=hljs-property>word</span>);
      }
    }
    <span class=hljs-keyword>return</span> out.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>);
  }
</code></pre>
<pre><code class=language-js><span class=hljs-title function_>simpleHammingErrorCorrector</span>(<span class=hljs-params>binaryMessage</span>){
  
  <span class=hljs-keyword>const</span> codeWords = <span class=hljs-title class_>Object</span>.<span class=hljs-title function_>values</span>(<span class=hljs-variable language_>this</span>.<span class=hljs-property>encoding</span>);
  <span class=hljs-keyword>let</span> bestCandidate = {}, bestDistance = <span class=hljs-title class_>Number</span>.<span class=hljs-property>POSITIVE_INFINITY</span>;

  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> codeWord <span class=hljs-keyword>of</span> codeWords){
    <span class=hljs-keyword>let</span> thisDistance = <span class=hljs-number>0</span>;;
    
    <span class=hljs-comment>//we&#x27;re scanning each word for a match</span>
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> i = <span class=hljs-number>0</span>; i &lt; codeWord.<span class=hljs-property>length</span>; i++){
      <span class=hljs-keyword>if</span>(codeWord[i] !== binaryMessage[i]) {
        thisDistance+=<span class=hljs-number>1</span>;
      }
    }
    <span class=hljs-keyword>if</span>(thisDistance &lt; bestDistance){
      bestDistance = thisDistance;
      bestCandidate = {<span class=hljs-attr>word</span>: <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>getAlpha</span>(codeWord), <span class=hljs-attr>binary</span>: codeWord, <span class=hljs-attr>distance</span>: bestDistance}
    }
  }
  <span class=hljs-keyword>return</span> bestCandidate;
}
</code></pre>
', 'Information Theory', 7, 930, '451964824', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/451964824/fb45b21d21', '2023-03-19 09:49:30.109505-07', '2023-03-19 09:49:30.109505-07', 'As you watch this video, note that it''s not always smooth and seamless. Behind the scenes, Vimeo (my video provider) is adjusting for bandwith changes, alternating the sources based on throughput. The player is compensating for packet loss as well, correcting for errors in audio and video.

This stuff is complicated and you''re about to see why.

This is part 1 of a 2-part series where we try to answer two simple questions:

 - Was there an error in the transmission?
 - Where is it?
 - 
This is tricky stuff! We''ll tackle the theory in this video and in the next one, part 2, we''ll spend the entire time writing the code necessary to fix my favorite Big Lebowski quote.

## The Code
Here''s the code used in the video. Note that the blurbs below are mostly for example. In the next video we''ll write more useful stuff.

```js
class Encoder{

  constructor(){

    this.encoding = {
      A : 01000000000,
      B : 10000000000,
      C : 00100000000,
      D : 00101000000,
      E : 10100000000,
      F : 10010000000,
      G : 01010000000,
      H : 11000000000,
      I : 11010000000,
      J : 01011000000,
      K : 01011001000,
      L : 10001000000,
      M : 01010100000,
      N : 01100000000,
      O : 01110000000,
      P : 10000100000,
      Q : 01011000100,
      R : 11100000000,
      S : 11110000000,
      T : 00110000000,
      U : 10011000000,
      V : 01011010000,
      W : 00100100000,
      X : 01011000110,
      Y : 01011100000,
      Z : 01011000111,
        : 00000000000
    }
  }
  encode(message){
    //loop the characters in the message
    //we''ll assume for now that they won''t enter anything but alpha numeric with a space for separation
    //also ... uppercase to reduce pain
    const words = message.toUpperCase(), out = [];

    for(let word of words){
      for(let char of word){
        const encoding = this.encoding[char];
        //if the character can be encoded great. If not, ignore
        if(encoding) out.push(encoding);
      }
    }
    return out.join();
  }   
  //add the methods below
}

  evenParity(){
    const keys = Object.keys(this.encoding);
    for(let key of keys){
      //default to even
      let pad = 0;
      //split into a character array so we can filter
      const chars = this.encoding[key].split('''');
      const ones = chars.filter(v => v === 1);
      //check mod 2 to see if we''re odd, if so, set the pad to 1
      if(ones.length % 2 !==0) pad = 1
      //update the encoding with a pad at the end
      this.encoding[key]+= pad;
    }
    console.log(this.encoding);
  }

  checkParity(word){
    //make sure we have the right length
    if(word.length !== 12) return false;
    //now make sure it''s even
    return word.split().filter(char => char === 1).length %2 === 0;
  }

  decode(binaryMessage){
    let out = [], codeWord = ;
    const pad = this.encoding.A.length;
    for(let i = 0; i < binaryMessage.length; i+=pad){
      codeWord = binaryMessage.substring(i, i + pad);
      const noError = this.checkParity(codeWord);
    
      if(noError){
        const key = this.getAlpha(codeWord);
        out.push(key);
        codeWord = ;
      }else{
        //this is an error!
        console.log(Got an error with , codeWord);
        const fix = this.simpleHammingErrorCorrector(codeWord);
        console.log(Fixing with best guess:, fix);
        out.push(fix.word);
      }
    }
    return out.join();
  }

simpleHammingErrorCorrector(binaryMessage){
  
  const codeWords = Object.values(this.encoding);
  let bestCandidate = {}, bestDistance = Number.POSITIVE_INFINITY;

  for(let codeWord of codeWords){
    let thisDistance = 0;;
    
    //we''re scanning each word for a match
    for(let i = 0; i < codeWord.length; i++){
      if(codeWord[i] !== binaryMessage[i]) {
        thisDistance+=1;
      }
    }
    if(thisDistance < bestDistance){
      bestDistance = thisDistance;
      bestCandidate = {word: this.getAlpha(codeWord), binary: codeWord, distance: bestDistance}
    }
  }
  return bestCandidate;
}
```
', NULL),
(9, 1, 'Error Correction, Part 2', 'error-correction-part-2', 'f', 'In the previous video we saw how we could correct errors using parity bits. In this video we''ll orchestrate those bits using some math along with a divide and conquer algorithm to correct single-bit errors in transmissions of any size.', '<p>This video contains and algorithm that you could very well be asked about in an interview: <em>The Hamming Code</em>. It&#39;s a deceptively simple algorithm to understand, very difficult to implement (at least for me).</p>
<p>We can use this algorithm to detect whether an error occurred in a digital transmission of <em>any</em> size - knowing precisely where it is and how to correct it.</p>
<p>It&#39;s a fun puzzler and I&#39;ll show you my solution in this video. </p>
<h2 id=the-code>The Code</h2>
<p>Here&#39;s the code used in the video. There&#39;s always room for improvement - feel free to suggest! Your comments, as always, are welcome and you can drop me an email or, when the code is published, feel free to leave an issue on GitHub.</p>
<p>Here are our utility functions:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> <span class=hljs-title function_>getParityBitPositions</span> = (<span class=hljs-params>message</span>) =&gt; {
  <span class=hljs-keyword>let</span> matrix={};
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> i=<span class=hljs-number>1</span>; i &lt;= message.<span class=hljs-property>length</span>; i = i * <span class=hljs-number>2</span>) {
    <span class=hljs-keyword>let</span> taken=<span class=hljs-number>0</span>; skipped=<span class=hljs-number>0</span>;
    matrix[i] = [];
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> x = i; x &lt;= message.<span class=hljs-property>length</span>; x++){
      <span class=hljs-keyword>if</span>(taken &lt; i) {
        matrix[i].<span class=hljs-title function_>push</span>(x)
        taken+=<span class=hljs-number>1</span>;
      }<span class=hljs-keyword>else</span>{
        skipped+=<span class=hljs-number>1</span>;
      }
      <span class=hljs-keyword>if</span>(skipped===taken) skipped = taken = <span class=hljs-number>0</span>;
    }
  }
  <span class=hljs-keyword>return</span> matrix;
}

<span class=hljs-keyword>const</span> addParityPlaceholder = <span class=hljs-keyword>function</span>(<span class=hljs-params>message</span>){
  <span class=hljs-keyword>const</span> digits= message.<span class=hljs-title function_>split</span>(<span class=hljs-string>&#x27;&#x27;</span>);
  <span class=hljs-keyword>const</span> matrix = <span class=hljs-title function_>getParityBitPositions</span>(message)
  <span class=hljs-comment>//add parity bits &quot;_&quot; to positions that are powers of two </span>
  <span class=hljs-comment>//as parity bits. (positions 1, 2, 4, 8, 16, 32, 64, etc.)</span>
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> b <span class=hljs-keyword>of</span> <span class=hljs-title class_>Object</span>.<span class=hljs-title function_>keys</span>(matrix)){
    <span class=hljs-comment>//...</span>
    digits.<span class=hljs-title function_>splice</span>(b-<span class=hljs-number>1</span>, <span class=hljs-number>0</span>, <span class=hljs-string>&quot;_&quot;</span>)
  }
  <span class=hljs-keyword>return</span> digits.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>);
}

<span class=hljs-keyword>const</span> flipABit = <span class=hljs-keyword>function</span>(<span class=hljs-params>message,n</span>){
  <span class=hljs-keyword>const</span> binaryMessage = message.<span class=hljs-title function_>split</span>(<span class=hljs-string>&quot;&quot;</span>);
  <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Flipping at&quot;</span>,n);
  binaryMessage[n] = binaryMessage[n] === <span class=hljs-string>&quot;1&quot;</span> ? <span class=hljs-string>&quot;0&quot;</span> : <span class=hljs-string>&quot;1&quot;</span>;
  <span class=hljs-keyword>return</span> binaryMessage.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>)
}
</code></pre>
<p>Next up, our parity calculators/correctors. Note that you&#39;ll need to export both of these if you want to plug them into your encoder.</p>
<pre><code class=language-js><span class=hljs-built_in>exports</span>.<span class=hljs-property>calcParity</span> = <span class=hljs-function>(<span class=hljs-params>message</span>) =&gt;</span> {
  <span class=hljs-keyword>const</span> withPlaceholders = <span class=hljs-title function_>addParityPlaceholder</span>(message);
  <span class=hljs-keyword>const</span> matrix = <span class=hljs-title function_>getParityBitPositions</span>(withPlaceholders);
  <span class=hljs-keyword>const</span> binaryMessage = withPlaceholders.<span class=hljs-title function_>split</span>(<span class=hljs-string>&#x27;&#x27;</span>);

  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> bitIndex <span class=hljs-keyword>of</span> <span class=hljs-title class_>Object</span>.<span class=hljs-title function_>keys</span>(matrix)){
    <span class=hljs-keyword>let</span> thisCalc=<span class=hljs-number>0</span>;
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> idx <span class=hljs-keyword>of</span> matrix[bitIndex]){
      <span class=hljs-keyword>if</span>(binaryMessage[idx-<span class=hljs-number>1</span>] === <span class=hljs-string>&quot;1&quot;</span>) thisCalc+=<span class=hljs-number>1</span>;
    }
    <span class=hljs-comment>// if(thisCalc % 2 &gt; 0) console.log(`Setting B${bitIndex} to 1 because ${thisCalc}`)</span>
    <span class=hljs-comment>// else console.log(`Leaving B${bitIndex} as 0 because ${thisCalc}`);</span>
    binaryMessage[bitIndex - <span class=hljs-number>1</span>] = thisCalc % <span class=hljs-number>2</span> &gt; <span class=hljs-number>0</span> ?  <span class=hljs-string>&quot;1&quot;</span> : <span class=hljs-string>&quot;0&quot;</span>
  }
  <span class=hljs-keyword>return</span> binaryMessage.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>)
}

<span class=hljs-built_in>exports</span>.<span class=hljs-property>correctAnyErrors</span> = <span class=hljs-function>(<span class=hljs-params>received</span>) =&gt;</span> {
  <span class=hljs-keyword>let</span> errorPosition =<span class=hljs-number>0</span>, matrix = <span class=hljs-title function_>getParityBitPositions</span>(received), binaryMessage = received.<span class=hljs-title function_>split</span>(<span class=hljs-string>&#x27;&#x27;</span>);
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> idx <span class=hljs-keyword>of</span> <span class=hljs-title class_>Object</span>.<span class=hljs-title function_>keys</span>(matrix)){
    <span class=hljs-keyword>let</span> dataBits = matrix[idx], dataBitSum = <span class=hljs-number>0</span>;
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> bit <span class=hljs-keyword>of</span> dataBits){
      <span class=hljs-keyword>const</span> bitIdx = <span class=hljs-built_in>parseInt</span>(bit) - <span class=hljs-number>1</span>; <span class=hljs-comment>//no off by 1!</span>
      dataBitSum+= <span class=hljs-built_in>parseInt</span>(binaryMessage[bitIdx]);
    }
    <span class=hljs-keyword>if</span>(dataBitSum % <span class=hljs-number>2</span> !== <span class=hljs-number>0</span>) { <span class=hljs-comment>//the error check</span>
      errorPosition += <span class=hljs-built_in>parseInt</span>(idx); <span class=hljs-comment>//it&#x27;s additive</span>
      <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Found error with Parity bit&quot;</span>,idx);
    }
  }
  <span class=hljs-keyword>if</span>(errorPosition &gt; <span class=hljs-number>0</span>){
    <span class=hljs-comment>//flip the error using the array of chars</span>
    <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Correcting error at position&quot;</span>,errorPosition-<span class=hljs-number>1</span>);
    binaryMessage[errorPosition-<span class=hljs-number>1</span>] = binaryMessage[errorPosition-<span class=hljs-number>1</span>] === <span class=hljs-string>&quot;1&quot;</span> ? <span class=hljs-string>&quot;0&quot;</span> : <span class=hljs-string>&quot;1&quot;</span>;
  }
  <span class=hljs-keyword>return</span> binaryMessage.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>);
}

<span class=hljs-built_in>exports</span>.<span class=hljs-property>removeParityBits</span> = <span class=hljs-function>(<span class=hljs-params>message</span>) =&gt;</span> {
  <span class=hljs-keyword>const</span> digits= message.<span class=hljs-title function_>split</span>(<span class=hljs-string>&#x27;&#x27;</span>);
  <span class=hljs-keyword>const</span> matrix = <span class=hljs-title function_>getParityBitPositions</span>(message);
  <span class=hljs-keyword>const</span> bitPositions = <span class=hljs-title class_>Object</span>.<span class=hljs-title function_>keys</span>(matrix);
  <span class=hljs-comment>//gotta go in reverse here because the index positions will change as we mutate the array</span>
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> i = bitPositions.<span class=hljs-property>length</span>-<span class=hljs-number>1</span>; i &gt;=<span class=hljs-number>0</span>; i--){
    <span class=hljs-keyword>const</span> bitPosition = bitPositions[i];
    digits.<span class=hljs-title function_>splice</span>(bitPosition-<span class=hljs-number>1</span>, <span class=hljs-number>1</span>);
  }
  <span class=hljs-keyword>return</span> digits.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>);
}
</code></pre>
', 'Information Theory', 8, 1387, '474440474', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/474440474/d9bc27b512', '2023-03-19 09:49:30.120444-07', '2023-03-19 09:49:30.120444-07', 'This video contains and algorithm that you could very well be asked about in an interview: _The Hamming Code_. It''s a deceptively simple algorithm to understand, very difficult to implement (at least for me).

We can use this algorithm to detect whether an error occurred in a digital transmission of _any_ size - knowing precisely where it is and how to correct it.

It''s a fun puzzler and I''ll show you my solution in this video. 

## The Code
Here''s the code used in the video. There''s always room for improvement - feel free to suggest! Your comments, as always, are welcome and you can drop me an email or, when the code is published, feel free to leave an issue on GitHub.

Here are our utility functions:

```js
const getParityBitPositions = (message) => {
  let matrix={};
  for(let i=1; i <= message.length; i = i * 2) {
    let taken=0; skipped=0;
    matrix[i] = [];
    for(let x = i; x <= message.length; x++){
      if(taken < i) {
        matrix[i].push(x)
        taken+=1;
      }else{
        skipped+=1;
      }
      if(skipped===taken) skipped = taken = 0;
    }
  }
  return matrix;
}

const addParityPlaceholder = function(message){
  const digits= message.split('''');
  const matrix = getParityBitPositions(message)
  //add parity bits _ to positions that are powers of two 
  //as parity bits. (positions 1, 2, 4, 8, 16, 32, 64, etc.)
  for(let b of Object.keys(matrix)){
    //...
    digits.splice(b-1, 0, _)
  }
  return digits.join();
}

const flipABit = function(message,n){
  const binaryMessage = message.split();
  console.log(Flipping at,n);
  binaryMessage[n] = binaryMessage[n] === 1 ? 0 : 1;
  return binaryMessage.join()
}
```

Next up, our parity calculators/correctors. Note that you''ll need to export both of these if you want to plug them into your encoder.

```js
exports.calcParity = (message) => {
  const withPlaceholders = addParityPlaceholder(message);
  const matrix = getParityBitPositions(withPlaceholders);
  const binaryMessage = withPlaceholders.split('''');

  for(let bitIndex of Object.keys(matrix)){
    let thisCalc=0;
    for(let idx of matrix[bitIndex]){
      if(binaryMessage[idx-1] === 1) thisCalc+=1;
    }
    // if(thisCalc % 2 > 0) console.log(`Setting B${bitIndex} to 1 because ${thisCalc}`)
    // else console.log(`Leaving B${bitIndex} as 0 because ${thisCalc}`);
    binaryMessage[bitIndex - 1] = thisCalc % 2 > 0 ?  1 : 0
  }
  return binaryMessage.join()
}

exports.correctAnyErrors = (received) => {
  let errorPosition =0, matrix = getParityBitPositions(received), binaryMessage = received.split('''');
  for(let idx of Object.keys(matrix)){
    let dataBits = matrix[idx], dataBitSum = 0;
    for(let bit of dataBits){
      const bitIdx = parseInt(bit) - 1; //no off by 1!
      dataBitSum+= parseInt(binaryMessage[bitIdx]);
    }
    if(dataBitSum % 2 !== 0) { //the error check
      errorPosition += parseInt(idx); //it''s additive
      console.log(Found error with Parity bit,idx);
    }
  }
  if(errorPosition > 0){
    //flip the error using the array of chars
    console.log(Correcting error at position,errorPosition-1);
    binaryMessage[errorPosition-1] = binaryMessage[errorPosition-1] === 1 ? 0 : 1;
  }
  return binaryMessage.join();
}

exports.removeParityBits = (message) => {
  const digits= message.split('''');
  const matrix = getParityBitPositions(message);
  const bitPositions = Object.keys(matrix);
  //gotta go in reverse here because the index positions will change as we mutate the array
  for(let i = bitPositions.length-1; i >=0; i--){
    const bitPosition = bitPositions[i];
    digits.splice(bitPosition-1, 1);
  }
  return digits.join();
}
```
', NULL),
(10, 1, 'Encryption Basics', 'encryption-basics', 'f', 'In this video we play around with cryptography and learn how to encrypt things in a very simple, basic way. We then ramp up our efforts quickliy, creating our own one-time pad and Diffie-Hellman secure key transmitter.', '<p>If you&#39;ve ever dabbled with cryptography you&#39;ve probably done the basics - something like a Caesar cipher - where you increment the letters of the alphabet by some value. We won&#39;t spend too much time doing that, nor will we dive into the various encryption algorithms out there. Instead, we&#39;ll come to understand that protecting your key is the name of the game when it comes to secure cryptography.</p>
<p>To that end, we&#39;ll create a one-time pad to see how disposable keys can help accomplish this. We&#39;ll then create our very own Diffie-Hellman key exchange to see how this groundbreaking algorithm changed cryptography forever.</p>
<h2 id=the-code>The Code</h2>
<p>Here&#39;s the code used in the video. There&#39;s always room for improvement - feel free to suggest! Your comments, as always, are welcome and you can drop me an email or, when the code is published, feel free to leave an issue on GitHub.</p>
<p>This is our alphabet for the one-time pad:</p>
<pre><code class=language-js><span class=hljs-keyword>class</span> <span class=hljs-title class_>Alphabet</span> {
  <span class=hljs-title function_>constructor</span>(<span class=hljs-params></span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>chars</span> = [
      <span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-string>&quot;B&quot;</span>, <span class=hljs-string>&quot;C&quot;</span>, <span class=hljs-string>&quot;D&quot;</span>,
      <span class=hljs-string>&quot;E&quot;</span>, <span class=hljs-string>&quot;F&quot;</span>, <span class=hljs-string>&quot;G&quot;</span>, <span class=hljs-string>&quot;H&quot;</span>,
      <span class=hljs-string>&quot;I&quot;</span>, <span class=hljs-string>&quot;J&quot;</span>, <span class=hljs-string>&quot;K&quot;</span>, <span class=hljs-string>&quot;L&quot;</span>,
      <span class=hljs-string>&quot;M&quot;</span>, <span class=hljs-string>&quot;N&quot;</span>, <span class=hljs-string>&quot;O&quot;</span>, <span class=hljs-string>&quot;P&quot;</span>,
      <span class=hljs-string>&quot;Q&quot;</span>, <span class=hljs-string>&quot;R&quot;</span>, <span class=hljs-string>&quot;S&quot;</span>, <span class=hljs-string>&quot;T&quot;</span>,
      <span class=hljs-string>&quot;U&quot;</span>, <span class=hljs-string>&quot;V&quot;</span>, <span class=hljs-string>&quot;W&quot;</span>, <span class=hljs-string>&quot;X&quot;</span>,
      <span class=hljs-string>&quot;Y&quot;</span>, <span class=hljs-string>&quot;Z&quot;</span>, <span class=hljs-string>&quot; &quot;</span>, <span class=hljs-string>&quot;?&quot;</span>, <span class=hljs-string>&quot;!&quot;</span>
    ];
  }
  <span class=hljs-title function_>getOffsetChar</span>(<span class=hljs-params>{char, offsetChar, encrypting=<span class=hljs-literal>true</span>}</span>){
    <span class=hljs-keyword>const</span> charPosition = <span class=hljs-variable language_>this</span>.<span class=hljs-property>chars</span>.<span class=hljs-title function_>indexOf</span>(char);
    <span class=hljs-keyword>const</span> keyPosition = <span class=hljs-variable language_>this</span>.<span class=hljs-property>chars</span>.<span class=hljs-title function_>indexOf</span>(offsetChar);
    <span class=hljs-keyword>const</span> offsetPosition = encrypting ? (charPosition + keyPosition) : (charPosition - keyPosition);
    <span class=hljs-keyword>let</span> idx = (offsetPosition) % <span class=hljs-variable language_>this</span>.<span class=hljs-property>chars</span>.<span class=hljs-property>length</span>;
    <span class=hljs-keyword>if</span>(offsetPosition &lt; <span class=hljs-number>0</span> ) idx = <span class=hljs-variable language_>this</span>.<span class=hljs-property>chars</span>.<span class=hljs-property>length</span> - -idx;
    <span class=hljs-keyword>return</span> <span class=hljs-variable language_>this</span>.<span class=hljs-property>chars</span>[idx]
  }

}
<span class=hljs-variable language_>module</span>.<span class=hljs-property>exports</span> = <span class=hljs-keyword>new</span> <span class=hljs-title class_>Alphabet</span>();
</code></pre>
<p>Here&#39;s super-simple Caesar cipher:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> <span class=hljs-title function_>offsetChars</span> = (<span class=hljs-params>text, offset=<span class=hljs-number>1</span></span>) =&gt; {
  <span class=hljs-keyword>const</span> out = [];
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> i=<span class=hljs-number>0</span>; i &lt; text.<span class=hljs-property>length</span>; i++){
    <span class=hljs-keyword>const</span> offsetIndex = text.<span class=hljs-title function_>charCodeAt</span>(i) + offset;
    out.<span class=hljs-title function_>push</span>(<span class=hljs-title class_>String</span>.<span class=hljs-title function_>fromCharCode</span>(offsetIndex))
  }
  <span class=hljs-keyword>return</span> out.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>);
}

<span class=hljs-keyword>class</span> <span class=hljs-title class_>Caesar</span> {
  <span class=hljs-title function_>constructor</span>(<span class=hljs-params>offset=<span class=hljs-number>5</span></span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>offset</span>=offset;
  }
  <span class=hljs-title function_>encrypt</span>(<span class=hljs-params>plainText</span>){
    <span class=hljs-keyword>return</span> <span class=hljs-title function_>offsetChars</span>(plainText, <span class=hljs-variable language_>this</span>.<span class=hljs-property>offset</span>);
  }
  <span class=hljs-title function_>decrypt</span>(<span class=hljs-params>cipherText</span>){
    <span class=hljs-keyword>return</span> <span class=hljs-title function_>offsetChars</span>(cipherText, -<span class=hljs-variable language_>this</span>.<span class=hljs-property>offset</span>);
  }
}
<span class=hljs-variable language_>module</span>.<span class=hljs-property>exports</span> = <span class=hljs-title class_>Caesar</span>;
</code></pre>
<p>The famous one-time pad that is theoretically unbreakable:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> alphabet = <span class=hljs-built_in>require</span>(<span class=hljs-string>&quot;./alphabet&quot;</span>);
<span class=hljs-keyword>const</span> pads = <span class=hljs-built_in>require</span>(<span class=hljs-string>&quot;../data/pads&quot;</span>);

<span class=hljs-keyword>const</span> offsets = <span class=hljs-keyword>function</span>(<span class=hljs-params>text, pad, encrypting=<span class=hljs-literal>true</span></span>){
  <span class=hljs-keyword>const</span> out = [], chars=text.<span class=hljs-title function_>split</span>(<span class=hljs-string>&quot;&quot;</span>), keys=pad.<span class=hljs-title function_>split</span>(<span class=hljs-string>&quot;&quot;</span>);
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> i=<span class=hljs-number>0</span>; i &lt; text.<span class=hljs-property>length</span>; i++){
    <span class=hljs-keyword>const</span> offsetChar = alphabet.<span class=hljs-title function_>getOffsetChar</span>({<span class=hljs-attr>char</span>: chars[i], <span class=hljs-attr>offsetChar</span>: keys[i], <span class=hljs-attr>encrypting</span>: encrypting})
    out.<span class=hljs-title function_>push</span>(offsetChar)
  }
  <span class=hljs-keyword>return</span> out.<span class=hljs-title function_>join</span>(<span class=hljs-string>&quot;&quot;</span>);
}

<span class=hljs-keyword>class</span> <span class=hljs-title class_>OneTimePad</span>{
  <span class=hljs-title function_>constructor</span>(<span class=hljs-params>padNumber</span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>pad</span> = pads[padNumber];
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>alphabetLength</span> = alphabet.<span class=hljs-property>length</span>;
  }
  <span class=hljs-title function_>encrypt</span>(<span class=hljs-params>plainText</span>){
    <span class=hljs-keyword>return</span> <span class=hljs-title function_>offsets</span>(plainText,<span class=hljs-variable language_>this</span>.<span class=hljs-property>pad</span>,<span class=hljs-literal>true</span>);
  }
  <span class=hljs-title function_>decrypt</span>(<span class=hljs-params>cipherText</span>){
    <span class=hljs-keyword>return</span> <span class=hljs-title function_>offsets</span>(cipherText,<span class=hljs-variable language_>this</span>.<span class=hljs-property>pad</span>,<span class=hljs-literal>false</span>);
  }
}
<span class=hljs-variable language_>module</span>.<span class=hljs-property>exports</span> = <span class=hljs-title class_>OneTimePad</span>;
</code></pre>
<p>Finally, the Diffie-Hellman key exchange:</p>
<pre><code class=language-js><span class=hljs-keyword>class</span> <span class=hljs-title class_>DiffieHellman</span>{
  <span class=hljs-title function_>constructor</span>(<span class=hljs-params>{generator, secret, modulus}={}</span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>generator</span> = generator;
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>secret</span> = secret;
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>modulus</span> = modulus;
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>publicKey</span> = <span class=hljs-title class_>Math</span>.<span class=hljs-title function_>pow</span>(<span class=hljs-variable language_>this</span>.<span class=hljs-property>generator</span>,<span class=hljs-variable language_>this</span>.<span class=hljs-property>secret</span>) % <span class=hljs-variable language_>this</span>.<span class=hljs-property>modulus</span>;
  }
  <span class=hljs-title function_>encryptionKey</span>(<span class=hljs-params>receiverPublicKey</span>){
    <span class=hljs-keyword>return</span> <span class=hljs-title class_>Math</span>.<span class=hljs-title function_>pow</span>(receiverPublicKey, <span class=hljs-variable language_>this</span>.<span class=hljs-property>secret</span>) % <span class=hljs-variable language_>this</span>.<span class=hljs-property>modulus</span>;
  }
}
<span class=hljs-variable language_>module</span>.<span class=hljs-property>exports</span> = <span class=hljs-title class_>DiffieHellman</span>;
</code></pre>
<p>I&#39;ll have this code up on GitHub when the videos are completed.</p>
', 'Crypto', 9, 1288, '483317971', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/483317971/f62cf8f013', '2023-03-19 09:49:30.123047-07', '2023-03-19 09:49:30.123047-07', 'If you''ve ever dabbled with cryptography you''ve probably done the basics - something like a Caesar cipher - where you increment the letters of the alphabet by some value. We won''t spend too much time doing that, nor will we dive into the various encryption algorithms out there. Instead, we''ll come to understand that protecting your key is the name of the game when it comes to secure cryptography.

To that end, we''ll create a one-time pad to see how disposable keys can help accomplish this. We''ll then create our very own Diffie-Hellman key exchange to see how this groundbreaking algorithm changed cryptography forever.

## The Code
Here''s the code used in the video. There''s always room for improvement - feel free to suggest! Your comments, as always, are welcome and you can drop me an email or, when the code is published, feel free to leave an issue on GitHub.

This is our alphabet for the one-time pad:

```js
class Alphabet {
  constructor(){
    this.chars = [
      A, B, C, D,
      E, F, G, H,
      I, J, K, L,
      M, N, O, P,
      Q, R, S, T,
      U, V, W, X,
      Y, Z,  , ?, !
    ];
  }
  getOffsetChar({char, offsetChar, encrypting=true}){
    const charPosition = this.chars.indexOf(char);
    const keyPosition = this.chars.indexOf(offsetChar);
    const offsetPosition = encrypting ? (charPosition + keyPosition) : (charPosition - keyPosition);
    let idx = (offsetPosition) % this.chars.length;
    if(offsetPosition < 0 ) idx = this.chars.length - -idx;
    return this.chars[idx]
  }

}
module.exports = new Alphabet();
```

Here''s super-simple Caesar cipher:

```js
const offsetChars = (text, offset=1) => {
  const out = [];
  for(let i=0; i < text.length; i++){
    const offsetIndex = text.charCodeAt(i) + offset;
    out.push(String.fromCharCode(offsetIndex))
  }
  return out.join();
}

class Caesar {
  constructor(offset=5){
    this.offset=offset;
  }
  encrypt(plainText){
    return offsetChars(plainText, this.offset);
  }
  decrypt(cipherText){
    return offsetChars(cipherText, -this.offset);
  }
}
module.exports = Caesar;
```

The famous one-time pad that is theoretically unbreakable:

```js
const alphabet = require(./alphabet);
const pads = require(../data/pads);

const offsets = function(text, pad, encrypting=true){
  const out = [], chars=text.split(), keys=pad.split();
  for(let i=0; i < text.length; i++){
    const offsetChar = alphabet.getOffsetChar({char: chars[i], offsetChar: keys[i], encrypting: encrypting})
    out.push(offsetChar)
  }
  return out.join();
}

class OneTimePad{
  constructor(padNumber){
    this.pad = pads[padNumber];
    this.alphabetLength = alphabet.length;
  }
  encrypt(plainText){
    return offsets(plainText,this.pad,true);
  }
  decrypt(cipherText){
    return offsets(cipherText,this.pad,false);
  }
}
module.exports = OneTimePad;
```

Finally, the Diffie-Hellman key exchange:

```js
class DiffieHellman{
  constructor({generator, secret, modulus}={}){
    this.generator = generator;
    this.secret = secret;
    this.modulus = modulus;
    this.publicKey = Math.pow(this.generator,this.secret) % this.modulus;
  }
  encryptionKey(receiverPublicKey){
    return Math.pow(receiverPublicKey, this.secret) % this.modulus;
  }
}
module.exports = DiffieHellman;
```

I''ll have this code up on GitHub when the videos are completed.
', NULL),
(11, 1, 'Hashing and Asymmetric Encryption', 'hashes', 'f', 'In this video we dive into hashing algorithms, how they''re used and what they''re good (and not so good) for. We''ll also dig into RSA, one of the most important pieces of software ever created.', '<p>I&#39;ve used hashes for a long time and had a general understanding of what they do... but that&#39;s about it. I knew I needed to hash passwords (and other secure data) if I was going to store them in my database... but that&#39;s about all. </p>
<p>I was never sure which algorithms to use nor why... so I dug in and found out. That&#39;s the first part of this video.</p>
<p>The second is asymmetric encryption: encoding with a public key and decoding with a second, private key. Absolutely ground-breaking idea! The math is amazingly straightforward too... although I will admit to struggling to explain some of it.</p>
<h2 id=the-code>The Code</h2>
<p>To produce a simple hash using Node:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> crypto = <span class=hljs-built_in>require</span>(<span class=hljs-string>&quot;crypto&quot;</span>);

<span class=hljs-keyword>const</span> hash = crypto.<span class=hljs-title function_>createHash</span>(<span class=hljs-string>&quot;sha256&quot;</span>)
.<span class=hljs-title function_>update</span>(<span class=hljs-string>&quot;hi&quot;</span>)
.<span class=hljs-title function_>digest</span>(<span class=hljs-string>&quot;hex&quot;</span>);

<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(hash);
</code></pre>
<p>Hashing a password with PBKDF2 using a million rounds to slow things down:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> crypto = <span class=hljs-built_in>require</span>(<span class=hljs-string>&quot;crypto&quot;</span>);

<span class=hljs-keyword>const</span> hashPassword = <span class=hljs-keyword>function</span>(<span class=hljs-params>pw</span>){
  <span class=hljs-keyword>return</span> <span class=hljs-keyword>new</span> <span class=hljs-title class_>Promise</span>(<span class=hljs-keyword>function</span>(<span class=hljs-params>resolve, reject</span>){
    crypto.<span class=hljs-title function_>pbkdf2</span>(pw,<span class=hljs-string>&quot;super-secret-salt&quot;</span>,<span class=hljs-number>1000000</span>,<span class=hljs-number>32</span>,<span class=hljs-string>&quot;sha512&quot;</span>, <span class=hljs-keyword>function</span>(<span class=hljs-params>err, buffer</span>){
      <span class=hljs-keyword>if</span>(err) <span class=hljs-title function_>reject</span>(err);
      <span class=hljs-keyword>else</span> <span class=hljs-title function_>resolve</span>(buffer.<span class=hljs-title function_>toString</span>(<span class=hljs-string>&quot;hex&quot;</span>))
    });
  })
}
</code></pre>
<p>Hashing using scrypt, assigning a cost:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> hashPassword = <span class=hljs-keyword>function</span>(<span class=hljs-params>pw</span>){
  <span class=hljs-keyword>return</span> <span class=hljs-keyword>new</span> <span class=hljs-title class_>Promise</span>(<span class=hljs-keyword>function</span>(<span class=hljs-params>resolve, reject</span>){
    crypto.<span class=hljs-title function_>scrypt</span>(pw,<span class=hljs-string>&quot;super-secret-salt&quot;</span>,<span class=hljs-number>32</span>, {<span class=hljs-attr>cost</span>: <span class=hljs-number>2</span>**<span class=hljs-number>14</span>}, <span class=hljs-keyword>function</span>(<span class=hljs-params>err, buffer</span>){
      <span class=hljs-keyword>if</span>(err) <span class=hljs-title function_>reject</span>(err);
      <span class=hljs-keyword>else</span> <span class=hljs-title function_>resolve</span>(buffer.<span class=hljs-title function_>toString</span>(<span class=hljs-string>&quot;hex&quot;</span>))
    });
  })
}
</code></pre>
<p>Creating a checksum using MD5:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> crypto = <span class=hljs-built_in>require</span>(<span class=hljs-string>&quot;crypto&quot;</span>);
<span class=hljs-keyword>const</span> fs = <span class=hljs-built_in>require</span>(<span class=hljs-string>&quot;fs&quot;</span>);

<span class=hljs-keyword>const</span> data = fs.<span class=hljs-title function_>readFileSync</span>(<span class=hljs-string>&quot;./message.txt&quot;</span>);

<span class=hljs-keyword>const</span> checksum = <span class=hljs-keyword>function</span>(<span class=hljs-params>data</span>){
  <span class=hljs-keyword>return</span> crypto.<span class=hljs-title function_>createHash</span>(<span class=hljs-string>&quot;md5&quot;</span>).<span class=hljs-title function_>update</span>(data, <span class=hljs-string>&quot;utf8&quot;</span>).<span class=hljs-title function_>digest</span>(<span class=hljs-string>&quot;hex&quot;</span>)
}

<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-title function_>checksum</span>(data));
</code></pre>
<p>A super-simple mining operation (meant for demonstration only) for blockchain stuff:</p>
<pre><code class=language-js><span class=hljs-keyword>const</span> crypto = <span class=hljs-built_in>require</span>(<span class=hljs-string>&quot;crypto&quot;</span>);

<span class=hljs-keyword>const</span> <span class=hljs-title function_>createHash</span> = (<span class=hljs-params>block</span>) =&gt; {
  <span class=hljs-comment>//need to pass a string to our </span>
  <span class=hljs-keyword>const</span> hashValue = <span class=hljs-title class_>JSON</span>.<span class=hljs-title function_>stringify</span>(block)
  <span class=hljs-keyword>return</span> crypto.<span class=hljs-title function_>createHash</span>(<span class=hljs-string>&quot;sha256&quot;</span>)
  .<span class=hljs-title function_>update</span>(hashValue)
  .<span class=hljs-title function_>digest</span>(<span class=hljs-string>&quot;base64&quot;</span>);
}

<span class=hljs-keyword>const</span> <span class=hljs-title function_>mine</span> = (<span class=hljs-params>block, difficulty = <span class=hljs-number>2</span></span>) =&gt; {
  <span class=hljs-keyword>let</span> found = <span class=hljs-literal>false</span>, start = <span class=hljs-keyword>new</span> <span class=hljs-title class_>Date</span>().<span class=hljs-title function_>getTime</span>();
  <span class=hljs-comment>//we&#x27;re looking for a string of 0s so let&#x27;s create the pattern</span>
  <span class=hljs-comment>//I could use Regex but I&#x27;m not that good</span>
  <span class=hljs-keyword>const</span> lookingFor = <span class=hljs-string>&quot;0&quot;</span>.<span class=hljs-title function_>padStart</span>(difficulty, <span class=hljs-string>&quot;0&quot;</span>);
  <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Looking for a hash starting with&quot;</span>, lookingFor);
  <span class=hljs-keyword>const</span> duration = <span class=hljs-keyword>new</span> <span class=hljs-title class_>Date</span>().<span class=hljs-title function_>getTime</span>() - start;

  <span class=hljs-keyword>while</span>(!found){
    <span class=hljs-keyword>const</span> possibleHash = <span class=hljs-title function_>createHash</span>(block);  
    <span class=hljs-comment>//does the hash start with zeroes?</span>
    found = possibleHash.<span class=hljs-title function_>substring</span>(<span class=hljs-number>0</span>, difficulty) === lookingFor;
    <span class=hljs-keyword>if</span>(found){
      block.<span class=hljs-property>hashKey</span> = possibleHash;
      <span class=hljs-keyword>return</span> block;
    }
    block.<span class=hljs-property>nonce</span> += <span class=hljs-number>1</span>;
    <span class=hljs-comment>//10 second kill switch</span>
    <span class=hljs-keyword>if</span>(duration &gt; <span class=hljs-number>10000</span>) <span class=hljs-keyword>return</span> <span class=hljs-string>&quot;Didn&#x27;t find it under 10s&quot;</span>
  }
}

<span class=hljs-keyword>const</span> block = {
  <span class=hljs-attr>transactions</span>: [
    {<span class=hljs-attr>from</span>: <span class=hljs-string>&quot;me&quot;</span>, <span class=hljs-attr>to</span>: <span class=hljs-string>&quot;you&quot;</span>, <span class=hljs-attr>amount</span>: <span class=hljs-number>10.00</span>},
    {<span class=hljs-attr>from</span>: <span class=hljs-string>&quot;you&quot;</span>, <span class=hljs-attr>to</span>: <span class=hljs-string>&quot;me&quot;</span>, <span class=hljs-attr>amount</span>: <span class=hljs-number>5.00</span>}
  ],
  <span class=hljs-attr>timestamp</span>: <span class=hljs-number>1609702546153</span>, <span class=hljs-comment>//if this changes the hash changes</span>
  <span class=hljs-attr>nonce</span>: <span class=hljs-number>0</span>,
  <span class=hljs-attr>previousKey</span>: <span class=hljs-string>&quot;00RSDThMVcQAvoocD3klO/6pjJ4a8pRbZ3ykk3XXhXE=&quot;</span>
}
<span class=hljs-comment>//let&#x27;s see how long this takes</span>
<span class=hljs-keyword>const</span> start = <span class=hljs-keyword>new</span> <span class=hljs-title class_>Date</span>().<span class=hljs-title function_>getTime</span>();
<span class=hljs-comment>//let&#x27;s do it!</span>
<span class=hljs-keyword>const</span> result = <span class=hljs-title function_>mine</span>(block, <span class=hljs-number>4</span>);
<span class=hljs-keyword>const</span> duration = <span class=hljs-keyword>new</span> <span class=hljs-title class_>Date</span>().<span class=hljs-title function_>getTime</span>() - start;
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>`That took duration <span class=hljs-subst>${duration}</span>ms`</span>);
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(result);
</code></pre>
<p>And finally, our trip through the basics of RSA using super small primes:</p>
<pre><code class=language-js><span class=hljs-comment>//resources</span>
<span class=hljs-comment>//https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html</span>
<span class=hljs-comment>//https://www.cryptool.org/en/cto/highlights/rsa-step-by-step</span>
<span class=hljs-comment>//let&#x27;s find two relatively prime numbers, e and d, such that</span>
<span class=hljs-comment>//e % d mod r === 1</span>
<span class=hljs-comment>//this is the cornerstone of RSA</span>
<span class=hljs-keyword>var</span> findEandD = <span class=hljs-keyword>function</span>(<span class=hljs-params>r</span>) {
  <span class=hljs-comment>//These are common candidates for e, which can be autoset</span>
  <span class=hljs-comment>//and typically 65537 is used, but we&#x27;ll</span>
  <span class=hljs-comment>//start small for speed</span>
  <span class=hljs-keyword>const</span> possibleEs = [<span class=hljs-number>3n</span>,<span class=hljs-number>5n</span>,<span class=hljs-number>17n</span>,<span class=hljs-number>257n</span>,<span class=hljs-number>65537n</span>]
  <span class=hljs-comment>//now, loop over the possible e&#x27;s so we can find our d</span>
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>let</span> e <span class=hljs-keyword>of</span> possibleEs){
    <span class=hljs-comment>//we want to find a coprime for e, so let&#x27;s factor it</span>
    <span class=hljs-comment>//up to r and see if e % r is 1</span>
    <span class=hljs-comment>//if it is, we found our coprime</span>
    <span class=hljs-keyword>for</span> (<span class=hljs-keyword>let</span> d = <span class=hljs-number>1n</span>; d &lt; r; d++) {
      <span class=hljs-keyword>const</span> candidate = e * d;
      <span class=hljs-keyword>if</span> (candidate % r == <span class=hljs-number>1n</span>) <span class=hljs-keyword>return</span> {<span class=hljs-attr>e</span>: e, <span class=hljs-attr>d</span>: d};
    }
  }
  assert.<span class=hljs-title function_>fail</span>(<span class=hljs-string>&quot;We shouldn&#x27;t reach this point&quot;</span>)
}

<span class=hljs-keyword>const</span> p = <span class=hljs-number>499n</span>;
<span class=hljs-keyword>const</span> q = <span class=hljs-number>491n</span>;
assert.<span class=hljs-title function_>notStrictEqual</span>(p,q, <span class=hljs-string>&quot;p and q must be different primes&quot;</span>);

<span class=hljs-comment>//our public key, N</span>
<span class=hljs-keyword>const</span> N = p * q;

<span class=hljs-comment>//Euler&#x27;s totient for deriving r</span>
<span class=hljs-comment>//r = phi(n) = (p-1) * (q-1)</span>
<span class=hljs-keyword>const</span> r = (p-<span class=hljs-number>1n</span>) * (q-<span class=hljs-number>1n</span>);

<span class=hljs-comment>//now we can calculate e and d for our private key</span>
<span class=hljs-keyword>const</span> {e,d} = <span class=hljs-title function_>findEandD</span>(r);

<span class=hljs-comment>//our message</span>
<span class=hljs-keyword>const</span> M = <span class=hljs-number>25n</span>;

<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;e&quot;</span>,e);
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;d&quot;</span>,d);
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;N&quot;</span>,N);
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;r&quot;</span>,r);

<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;M&quot;</span>, M);

<span class=hljs-comment>//the RSA algorithm</span>
<span class=hljs-keyword>const</span> encrypted = M**e % N;
<span class=hljs-keyword>const</span> decrypted = encrypted**d % N;

<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Encrypted&quot;</span>,encrypted);
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-string>&quot;Decrypted&quot;</span>,decrypted);
</code></pre>
<h2 id=links-and-resources>Links and Resources</h2>
<p>I cite a number of articles in this video - hard not to. But here they are if you want to read more:</p>
<ul>
<li><a href=https://www.hanselman.com/blog/decoding-an-ssh-key-from-pem-to-base64-to-hex-to-asn1-to-prime-decimal-numbers>Scott Hanselman digs into an SSH Key</a></li>
<li><a href=http://doctrina.org/How-RSA-Works-With-Examples.html>How RSA Works, With Examples</a></li>
<li><a href=https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html>The RSA Calculator</a></li>
</ul>
', 'Crypto', 10, 2065, '498544682', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/498544682/afb868e3f6', '2023-03-19 09:49:30.1254-07', '2023-03-19 09:49:30.1254-07', 'I''ve used hashes for a long time and had a general understanding of what they do... but that''s about it. I knew I needed to hash passwords (and other secure data) if I was going to store them in my database... but that''s about all. 

I was never sure which algorithms to use nor why... so I dug in and found out. That''s the first part of this video.

The second is asymmetric encryption: encoding with a public key and decoding with a second, private key. Absolutely ground-breaking idea! The math is amazingly straightforward too... although I will admit to struggling to explain some of it.

## The Code

To produce a simple hash using Node:

```js
const crypto = require(crypto);

const hash = crypto.createHash(sha256)
.update(hi)
.digest(hex);

console.log(hash);
```

Hashing a password with PBKDF2 using a million rounds to slow things down:

```js
const crypto = require(crypto);

const hashPassword = function(pw){
  return new Promise(function(resolve, reject){
    crypto.pbkdf2(pw,super-secret-salt,1000000,32,sha512, function(err, buffer){
      if(err) reject(err);
      else resolve(buffer.toString(hex))
    });
  })
}

```

Hashing using scrypt, assigning a cost:

```js
const hashPassword = function(pw){
  return new Promise(function(resolve, reject){
    crypto.scrypt(pw,super-secret-salt,32, {cost: 2**14}, function(err, buffer){
      if(err) reject(err);
      else resolve(buffer.toString(hex))
    });
  })
}
```

Creating a checksum using MD5:

```js
const crypto = require(crypto);
const fs = require(fs);

const data = fs.readFileSync(./message.txt);

const checksum = function(data){
  return crypto.createHash(md5).update(data, utf8).digest(hex)
}

console.log(checksum(data));
```

A super-simple mining operation (meant for demonstration only) for blockchain stuff:

```js
const crypto = require(crypto);

const createHash = (block) => {
  //need to pass a string to our 
  const hashValue = JSON.stringify(block)
  return crypto.createHash(sha256)
  .update(hashValue)
  .digest(base64);
}

const mine = (block, difficulty = 2) => {
  let found = false, start = new Date().getTime();
  //we''re looking for a string of 0s so let''s create the pattern
  //I could use Regex but I''m not that good
  const lookingFor = 0.padStart(difficulty, 0);
  console.log(Looking for a hash starting with, lookingFor);
  const duration = new Date().getTime() - start;

  while(!found){
    const possibleHash = createHash(block);  
    //does the hash start with zeroes?
    found = possibleHash.substring(0, difficulty) === lookingFor;
    if(found){
      block.hashKey = possibleHash;
      return block;
    }
    block.nonce += 1;
    //10 second kill switch
    if(duration > 10000) return Didn''t find it under 10s
  }
}

const block = {
  transactions: [
    {from: me, to: you, amount: 10.00},
    {from: you, to: me, amount: 5.00}
  ],
  timestamp: 1609702546153, //if this changes the hash changes
  nonce: 0,
  previousKey: 00RSDThMVcQAvoocD3klO/6pjJ4a8pRbZ3ykk3XXhXE=
}
//let''s see how long this takes
const start = new Date().getTime();
//let''s do it!
const result = mine(block, 4);
const duration = new Date().getTime() - start;
console.log(`That took duration ${duration}ms`);
console.log(result);
```

And finally, our trip through the basics of RSA using super small primes:

```js
//resources
//https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html
//https://www.cryptool.org/en/cto/highlights/rsa-step-by-step
//let''s find two relatively prime numbers, e and d, such that
//e % d mod r === 1
//this is the cornerstone of RSA
var findEandD = function(r) {
  //These are common candidates for e, which can be autoset
  //and typically 65537 is used, but we''ll
  //start small for speed
  const possibleEs = [3n,5n,17n,257n,65537n]
  //now, loop over the possible e''s so we can find our d
  for(let e of possibleEs){
    //we want to find a coprime for e, so let''s factor it
    //up to r and see if e % r is 1
    //if it is, we found our coprime
    for (let d = 1n; d < r; d++) {
      const candidate = e * d;
      if (candidate % r == 1n) return {e: e, d: d};
    }
  }
  assert.fail(We shouldn''t reach this point)
}

const p = 499n;
const q = 491n;
assert.notStrictEqual(p,q, p and q must be different primes);

//our public key, N
const N = p * q;

//Euler''s totient for deriving r
//r = phi(n) = (p-1) * (q-1)
const r = (p-1n) * (q-1n);

//now we can calculate e and d for our private key
const {e,d} = findEandD(r);

//our message
const M = 25n;

console.log(e,e);
console.log(d,d);
console.log(N,N);
console.log(r,r);

console.log(M, M);

//the RSA algorithm
const encrypted = M**e % N;
const decrypted = encrypted**d % N;

console.log(Encrypted,encrypted);
console.log(Decrypted,decrypted);
```

## Links and Resources

I cite a number of articles in this video - hard not to. But here they are if you want to read more:

 - [Scott Hanselman digs into an SSH Key](https://www.hanselman.com/blog/decoding-an-ssh-key-from-pem-to-base64-to-hex-to-asn1-to-prime-decimal-numbers)
 - [How RSA Works, With Examples](http://doctrina.org/How-RSA-Works-With-Examples.html)
 - [The RSA Calculator](https://www.cs.drexel.edu/~jpopyack/IntroCS/HW/RSAWorksheet.html)
', NULL),
(12, 1, 'Functional Programming', 'functional-programming', 'f', 'Functional programming builds on the concepts developed by Church when he created Lambda Calculus. We''ll be using Elixir for this one, which is a wonderful language to use when discovering functional programming for the first time', '', 'CS Theory', 11, 1304, '207211031', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207211031/7aecc45759', '2023-03-19 09:49:30.133212-07', '2023-03-19 09:49:30.133212-07', 'Functional Programming: some people love it and claim it’s the only way to write software. Others see it as a fad and roll their eyes.

Let’s come away from those extremes. Functional Programming is based in a foundational concept which we learned about a few chapters ago: Lambda Calculus. It’s not magical, nor is it something you should ignore because you’re amazing. It is simply something you need to understand.

Like most things in Computer Science, functional programming is full of jargon, idioms and practices that, at first, might be a bit opaque. If you take the time, however, to let it soak in… functional programming can change the way you write software if you come from an object-oriented background.
', NULL),
(13, 1, 'Lambda Calculus', 'lambda-calculus', 'f', 'Before their were computers or programming languages, Alonzo Church came up with a set of rules for working with functions, what he termed lambdas. These rules allow you to compute anything that can be computed.', '', 'CS Theory', 12, 1215, '207549864', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207549864/5175d59e59', '2023-03-19 09:49:30.135582-07', '2023-03-19 09:49:30.135582-07', 'You use Lambda Calculus every day when you write code. Do you know how it works? As a programmer, understanding Lambda Calculus can enhance your skills but it is the very definition of _academic_.

## Pure Math

There are no numbers in Lambda Calculus - **only functions**. These functions are purely representative and it can bend your brain but then... _you get it_ and you start to realize just how fundamental these concepts are. Lambda Calculus is a pure joy to play with, but there is a bit of a learning curve.
', NULL),
(14, 1, 'Database Normalization', 'database-normalization', 'f', 'How does a spreadsheet become a highly-tuned set of tables in a relational system? There are rules for this - the rules of normalization - which is an essential skill for any developer working with data', '', 'CS Theory', 13, 2039, '206467218', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/206467218/10456bba13', '2023-03-19 09:49:30.136558-07', '2023-03-19 09:49:30.136558-07', 'There is an established way to design a transactional database: following the rules of normalization. This is the process of essentially turning a single, large spreadsheet into a set of related tables.

Transactional systems can back our applications, but analytical systems power decision making. Data warehouses and data marts store the data and OLAP systems provide the analysis infrastructure.
', NULL),
(15, 1, 'Review: Big-O Notation', 'big-o-notation', 'f', 'It''s a thing you''ll need to know if you plan to get through any interview. It''s actually quite useful and in this post I''ll hopefully make the case that''s it''s simple as well.', '<p><em>No video for this one - just a quick review of Big-O</em>.</p>
<p>When I started writing <strong><a href=https://bigmachine.io/products/the-imposters-handbook/>The Imposter’s Handbook</a></strong>, this was the question that was in my head from the start: <em>what the f***</em> is Big O and why should I care?I remember giving myself a few weeks to jump in and figure it out but, fortunately, I found that it was pretty straightforward after putting a few smaller concepts together.</p>
<p><strong>Big O is conceptual</strong>. Many people want to qualify the efficiency of an algorithm based on the number of inputs. A common thought is <em>if I have a list with 1 item it can’t be O(n) because there’s only 1 item so it’s O(1)</em>. This is an understandable approach, but <strong>Big O is a technical adjective</strong>, it’s not a benchmarking system. It’s simply using math to describe the efficiency of what you’ve created.</p>
<p><strong>Big O is worst-case</strong>, always. That means that even if you think you’re looking for is the very first thing in the set, Big O doesn’t care, a loop-based find is still considered O(<em>n</em>). That’s because Big O is just a descriptive way of thinking about the code you’ve written, not the inputs expected.</p>
<h2 id=an-amazingly-useful-concept>An Amazingly Useful Concept</h2>
<p>I’m glad I took the time to learn Big O because <strong>I find myself thinking about it  often</strong>. If you’ve always wondered about Big O but found the descriptions a bit too academic, I’ve put together a bit of a <strong>Common Person’s Big O Cheat Sheet,</strong> along with how you might use Big O in your every day work.</p>
<p>Rather than base this on arrays and simplified nonsense, I’ll share with you a situation that I was in just a year ago: <strong>choosing the right data structure in Redis.</strong> If you’ve never used Redis before, it’s a very basic key-value store that works in-memory and can optionally persist your data to disk.</p>
<p>When you work in a relational database like PostgreSQL, MySQL, or SQL Server you get a single data structure: <strong>the table</strong>. Yes, there are data <strong>types</strong>, sure, but your data is stored in a row separated by columns, which is a data <strong>structure</strong>.</p>
<p>Redis gives you a bit more flexibility. You get to choose the data structure that fits your programming need the best. There are a bunch of them, but the ones I find myself using most often are:</p>
<ul>
<li><strong>String.</strong> With this structure you store a string value (which could be JSON) with a single key.</li>
<li><strong>Set.</strong> A Set in Redis is a bunch of unordered, unique string values.</li>
<li><strong>Sorted Set</strong>. Just like a Set, but sorted.</li>
<li><strong>List</strong>. Non-unique string values sorted <strong>by order of insertion</strong>. These things operate like both stacks and queues.</li>
<li><strong>Hash</strong>. A set of string values identified by “sub keys”. You can think of this as a JSON object with values being only strings.</li>
</ul>
<p><strong>Why are we talking about Redis when this post is about Big O</strong>? Because <em>Redis and Big O go hand in hand</em>. To choose the right data structure for your needs, you need to dig you some Big O (whether you know it’s Big O or not).</p>
<h2 id=finding-something-in-a-shopping-cart>FINDING SOMETHING IN A SHOPPING CART</h2>
<p>Let’s say you’re tasked with storing Shopping Cart data in Redis. Your team has decided that an in-memory system would work well because it’s fast and it doesn’t matter if cart data is lost if the server blows up.</p>
<p>The question is: <strong>how do you store this information?</strong> Here’s what’s required:</p>
<ul>
<li>Finding the cart quickly by key</li>
<li>CRUD operations on each item within the cart</li>
<li>Finding an item in the cart quickly</li>
<li>Iterating over each item in the cart</li>
</ul>
<p>Believe it or not, <strong>you’re thinking in Big O right now</strong> and you might not even know it. I used the words “quickly” and “iterate” above, which may or may not mean something to you in a technical sense. The thing I was trying to convey by using the word “quickly” is that I want to get to the cart (or an item within it) <strong>directly</strong>, without having to jump through a lot of hoops.</p>
<p>Even that description is really arm-wavy, isn’t it? We can dispose of the arm-waving by <strong>thinking about things in terms of operations per input</strong>. How many operations does my code need to perform to get to a single cart from the set of all carts in Redis?</p>
<h2 id=only-one-operation-o1>ONLY ONE OPERATION: <em>O(1)</em></h2>
<p>The cool thing about Redis is that it’s a key-value store. To find something, you just need to know its key. You don’t have to run a loop or do some complex find routine – it’s just right there for you.</p>
<p>When something requires only one operation we can say that directly: <strong>my code for finding a shopping cart is on the order of 1 operation</strong>. If we want to be Big O about it, <strong>we can say it’s order 1, or “O(1)”</strong>. It doesn’t matter how many carts are in our Redis database either! We have a key and we can go right to it.</p>
<p>A more precise way to think about this is to use the term “constant time”. It doesn’t matter how many rows of data are in our database (or, correspondingly, how many inputs to our algorithm) – the algorithm will run in <strong>constant time</strong> which doesn’t change.</p>
<p>What about the items in the cart itself?</p>
<h2 id=looping-over-a-set-on>LOOPING OVER A SET: O(<em>N</em>)</h2>
<p>We know that our cart will need to store 0 to <em>n</em> items. I’m using <em>n</em> here because I don’t know how many items that will be – it varies per customer.</p>
<p>I can use <strong>any</strong> of Redis’s data structures for this:</p>
<ul>
<li>I can store a JSON blob in a String, identified by a unique cart key</li>
<li>I can store items in a Set or Sorted Set, with each item being a bit of JSON that represents a <code>CartItem</code></li>
<li>I can store things in a List in the same way as a set</li>
<li>I can store things in a Hash, with each item having a unique sub key</li>
</ul>
<p>When it comes to items in the cart, we need to be able to do CRUD stuff but we also need to be able to find an item in the cart “as quickly as possible”. If we use a String (serializing it into JSON first), a Set or a List we’ll need to loop over every item in a cart in order to find the one we’re looking for.</p>
<p>Rather than saying “need to loop over every item”, we can think about things in terms of operations again: <strong>if I use a Set or a List or a String I’ll need to have one operation for every n items in my cart</strong>. We can also say that this is “order <em>n</em>“, or just O(<em>n</em>).</p>
<p>You can spot O(<em>n</em>) operations easily by simply looking for loops in your code. This is my rule of thumb: “if there’s a loop, it’s O(<em>n</em>)”.</p>
<h2 id=looping-within-a-loop-on2>LOOPING WITHIN A LOOP: O(<em>N^2</em>)</h2>
<p>Let’s say we decided to keep things simple and deal with problems as they arise so we chose a Set, allowing us to dump unique blobs of JSON data that we can loop over if we need to. Unfortunately for us, this caused some issues:</p>
<p><img src=/img/posts/screenshot_57.jpg alt=></p>
<p>By changing the <code>quantity</code> in our <code>CartItem</code> we have made our JSON string unique, causing duplication. We need to remove these duplications now, otherwise our customers won’t be happy.</p>
<p>Simple enough to do: we just loop over the items within a cart, and then loop over the items one more time (skipping the current loop index) to see if there’s a match on <code>sku</code>. This is a classic <strong>brute force</strong> algorithm for deduping an array. That’s a lot of words to describe this nested loop algorithm and we can do better if we use Big O.</p>
<p>Thinking in terms of operations, we have <em>n</em> operations per <em>n</em> items in our cart. That’s <code>n * n</code> operations, which we can shorthand to “order <em>n</em> squared” or O(<em>n</em>^2). Put another way: <strong>deduping an array is an O(n^2) operation, which isn’t terribly efficient</strong>.</p>
<p>As I said before, I like to think of these things in terms of loops. My rule of thumb here is that if <strong>I have to use a loop within a loop, that’s O(<em>n^2</em>)</strong>. Another rule of thumb is that the term “brute force” almost always denotes an O(<em>n^2</em>) algorithm that uses some kind of nested loop.</p>
<h2 id=indexing-a-database-table-and-olog-n>INDEXING A DATABASE TABLE AND O(<em>LOG N</em>).</h2>
<p>If you’ve ever worked on a larger project with a DBA, you’ve probably been barked at for querying a table without utilizing an index (a “fuzzy” search, for instance). Have you ever wondered what the deal is? I have. I <em>was</em> that DBA doing the barking!</p>
<p>Here’s the thing: tables tend to grow over time. Let’s say that our commerce site is selling independent digital films and our catalog is constantly growing. We might have a table called <code>film</code> filled with ridiculous test data that we want to query based on <code>title</code>. Unfortunately, we don’t have an index just yet and our query is beginning to slow down. We decide to ask PostgreSQL what’s going on using <code>EXPLAIN</code> and <code>ANALYZE</code>:</p>
<p><img src=/img/posts/screenshot_58.jpg alt=></p>
<p>Our database is doing what’s called a “Sequential Scan”. In SQL Server land this is called a “Full Table Scan” and it basically means that Postgres has to loop over every row, comparing the <code>title</code> to our query argument.</p>
<p>In other words: a Sequential Scan is a loop over every item which means it’s O(<em>n</em>), where <em>n</em> represents the number of rows in our table. As our table grows, the efficiency of this algorithm goes down linearly.</p>
<p>It’s easy to improve the performance here by adding an index:</p>
<p><img src=/img/posts/screenshot_59.jpg alt=></p>
<p>Now we’re using an <strong>Index Scan</strong>, which is, I suppose, much faster. But how much? And how does it work?</p>
<p>Under the covers, most databases use a version of an algorithm called <strong>binary search</strong> – <a href=https://bigmachine.io/products/the-imposters-handbook/>I made a video</a> about this and other algorithms which you can <a href=https://bigmachine.io/products/the-imposters-handbook/>watch right here</a> if you want. For binary search to work properly, you have to sort the list of things you’re working with. That’s exactly what Postgres does when you first create the index:</p>
<p><img src=/img/posts/screenshot_61.jpg alt=></p>
<p>Now that the index is sorted, Postgres can find the <code>title</code> we’re looking for by systematically splitting this list in half until there’s only one row left, which will be the one we want.</p>
<p>This is much better than looping over every row (which we know is O(<em>n</em>)), but how many operations do we have here? For this we can use <strong>logarithms:</strong></p>
<p><img src=/img/posts/screenshot_62.jpg alt=></p>
<p>We’re continually splitting things in half in a sorted set until we arrive at the thing we want. We can describe this with an inverted binary tree, as you see above. We start with 8 values, split, and are left with 4, which we split again to get 2, then finally 1.</p>
<p>This is an inverse squaring operation as we’re going from 2^3 (8) down to 2^2 (4) down to 2^1 (2) and finally 2^0 (1). Inverse squaring operations are called <strong>logarithms</strong>. That means that we can now describe the operations of our database index as “being logarithmic”. We should also specify “logarithmic of <strong>what</strong>” to which we can answer “we don’t know, so we’ll say it’s <em>n</em>“, also known as O(<em>log n</em>).</p>
<p>This kind of algorithm is called “divide and conquer” and when you see those words, you know immediately that you’re talking about a <em>log n</em> algorithm.</p>
<h2 id=-and-so-what>… AND SO WHAT?</h2>
<p>Here’s why you care about turning something that’s O(<em>n</em>) into O(<em>log n</em>) and the best part is that it’s not really arguable <em>because it’s math</em> (I was told that means you’re always right :trollface:).</p>
<p>Let’s say we have 1000 records in our <code>film</code> table. To find “Academy Dinosaur” our database will need to do 1000 operations (comparing the <code>title</code> in each row). But how many will it do if we use an index? Let’s use a calculator and find out, shall we? I need to find the log base 2 (because of the binary split) of 1000:</p>
<p><img src=/img/posts/screenshot_63.jpg alt=></p>
<p>Only Ten! Ten splits of 1000 records to find what we want in our database. That’s a performance gain of a few orders of magnitude, and it’s a lot more convincing to tell someone <strong>that</strong> as opposed to “it’s a lot faster”.</p>
<p>The best part here is that we can keep using this calculator to find out how many operations will be needed if we have a <strong>million</strong> records (it’s 20) or a <strong>billion</strong> (it’s 30). That kind of scaling as our inputs goes up is the stuff of DBA dreams.</p>
<h2 id=bonus-question-whats-the-big-o-of-a-primary-key-lookup>BONUS QUESTION: WHAT’S THE BIG O OF A PRIMARY KEY LOOKUP?</h2>
<p>It’s tempting to think that if I have a primary key and I know the value of that key that I <strong>should</strong> be able to simply go right to it. Is that what happens? Think about it for a second and while you’re thinking let’s talk about Redis a bit more.</p>
<p>A major selling point of Redis (or any key-value system really) is that you can do a <strong>lot</strong> of stuff with O(1) <strong>time complexity</strong>. That’s what we’re measuring when we talk about Big O – <strong>time complexity</strong>, or long something takes given the inputs to an algorithm you’re working with. There’s also <strong>space complexity</strong> which has to do with the resources your algorithm needs, but I’ll save that for another post.</p>
<p>Redis is a key-value store, which means that if you have a key, you have an O(1) operation. For our Shopping Cart above, if I use a Hash I’ll have a key for the cart <strong>as well as</strong> a key for each item in the cart, which is huge in terms of performance – or I should say “optimal time complexity”. We can access any item in a cart without a single loop, which makes things fast. Super fast.</p>
<p>OK, back to the question regarding primary key queries: are they O(1)? <strong>Nope</strong>:</p>
<p><img src=/img/posts/screenshot_64.jpg alt=></p>
<p>Indexes in most database systems tend to use a variation of binary search, and primary key indexes are <strong>no different</strong>. That said, there are plenty of optimizations that databases use under the covers to make these queries extremely fast.</p>
<p>I should also note that some databases, like Postgres, offer you different types of indexes. For instance you can use a Hash Index with Postgres that will give you O(1) access to a given record. There is a lot going on behind the scenes, however, to the point where <a href=https://dba.stackexchange.com/questions/212685/how-is-it-possible-for-hash-index-not-to-be-faster-than-btree-for-equality-looku>there’s a pretty good debate</a> about whether they’re actually faster. I’ll side step this discussion and you can go read more for yourself.</p>
<h2 id=there-you-have-it>THERE YOU HAVE IT</h2>
<p>I find myself thinking about things in terms of Big O a lot. The cart example, above, happened to me just over a month ago and I needed to make sure that I was flexing the power of Redis as much as possible.</p>
<p>I don’t want to turn this into a Redis commercial, but I will say that it (and systems like it) have a lot to offer when you start thinking about things in terms of <strong>time complexity</strong>, which you should! <strong>It’s not premature optimization to think about Big O upfront, it’s programming</strong> and I don’t mean to sound snotty about that! If you can clip an O(<em>n</em>) operation down to O(<em>log n</em>) then you should, don’t you think?</p>
<p>So, quick review:</p>
<ul>
<li>Plucking an item from a list using an index or a key: O(1)</li>
<li>Looping over a set of <em>n</em> items: O(<em>n</em>)</li>
<li>A nested loop over <em>n</em> items: O(<strong>n^2</strong>)</li>
<li>A divide and conquer algorithm: O(<strong>log n</strong>)</li>
</ul>
', 'Data Structures and Algorithms', 14, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.137599-07', '2023-03-19 09:49:30.137599-07', NULL, NULL),
(16, 1, 'Arrays and Linked Lists', 'arrays-linked-lists', 't', 'The building block data structures from which so many others are built. Arrays are incredibly simple - but how much do you know about them? Can you build a linked list from scratch?', '<h2 id=arrays>Arrays</h2>
<p>Everyone knows arrays, right? But <em>do you really know how an array works</em> in the CompSci sense? Yes there are arrays in JavaScript and other languages - but these things do quite a lot more than the traditional array. I&#39;ll get into that later. </p>
<p>An array is a collection of values that is <strong>stored in contiguous memory</strong>. This means that once you create an array, that&#39;s it! It can&#39;t be resized unless another block of memory is allocated. You can&#39;t add items to an array nor can you take them away. Iteration is fast and simple, however, because things reside right next to each other in memory.</p>
<p>Locating a value within an array can be done in two ways: by index or by iteration. These have time complexity implications (aka &quot;Big-O&quot;) - do you know what they are?</p>
<h2 id=linked-lists>Linked Lists</h2>
<p>A Linked List is a very simple structure that consists of a &quot;wrapper&quot; around some data, called a &quot;node&quot; that also has a pointer to the next node in the list. A traditional linked list goes one direction: <em>forward</em>.</p>
<p>Here&#39;s some code you could start with:</p>
<pre><code class=language-js><span class=hljs-keyword>class</span> <span class=hljs-title class_>Node</span>{
  <span class=hljs-title function_>constructor</span>(<span class=hljs-params>val</span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>value</span> = val;
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>next</span> = <span class=hljs-literal>null</span>;
  }
  <span class=hljs-title function_>addNext</span>(<span class=hljs-params>val</span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>next</span> = <span class=hljs-keyword>new</span> <span class=hljs-title class_>Node</span>(val);
    <span class=hljs-keyword>return</span> <span class=hljs-variable language_>this</span>.<span class=hljs-property>next</span>;
  }
}
</code></pre>
<p>A linked list is much more flexible than an array, why do you think that would be? </p>
<h2 id=doubly-linked-lists>Doubly Linked Lists</h2>
<p>Just like a regular linked list, but with these you can go forward <em>and</em> backward. A <strong>very popular interview question</strong> might ask you to create a linked list from scratch. Can you do that? Maybe after you watch the video you can.</p>
<p>Both doubly and singly-linked lists have limitations - do you know what those might be? One of them has to do with accessing a particular value. What do you think the Big-O of a traditional linked list is? </p>
<h2 id=popular-interview-questions>Popular Interview Questions</h2>
<p>If you&#39;re going for a junior position at a large company, you might be asked one of the following:</p>
<ul>
<li>How would you reverse a linked list?</li>
<li>How can you tell if a linked list has a cycle?</li>
<li>Write some code to remove a node from a linked list without breaking the list.</li>
</ul>
', 'Data Structures and Algorithms', 15, 1251, '416743654', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/416743654/8d392071de', '2023-03-19 09:49:30.140867-07', '2023-03-19 09:49:30.140867-07', '## Arrays

Everyone knows arrays, right? But _do you really know how an array works_ in the CompSci sense? Yes there are arrays in JavaScript and other languages - but these things do quite a lot more than the traditional array. I''ll get into that later. 

An array is a collection of values that is **stored in contiguous memory**. This means that once you create an array, that''s it! It can''t be resized unless another block of memory is allocated. You can''t add items to an array nor can you take them away. Iteration is fast and simple, however, because things reside right next to each other in memory.

Locating a value within an array can be done in two ways: by index or by iteration. These have time complexity implications (aka Big-O) - do you know what they are?

## Linked Lists

A Linked List is a very simple structure that consists of a wrapper around some data, called a node that also has a pointer to the next node in the list. A traditional linked list goes one direction: _forward_.

Here''s some code you could start with:

```js
class Node{
  constructor(val){
    this.value = val;
    this.next = null;
  }
  addNext(val){
    this.next = new Node(val);
    return this.next;
  }
}
```

A linked list is much more flexible than an array, why do you think that would be? 

## Doubly Linked Lists

Just like a regular linked list, but with these you can go forward _and_ backward. A **very popular interview question** might ask you to create a linked list from scratch. Can you do that? Maybe after you watch the video you can.

Both doubly and singly-linked lists have limitations - do you know what those might be? One of them has to do with accessing a particular value. What do you think the Big-O of a traditional linked list is? 

## Popular Interview Questions

If you''re going for a junior position at a large company, you might be asked one of the following:

 - How would you reverse a linked list?
 - How can you tell if a linked list has a cycle?
 - Write some code to remove a node from a linked list without breaking the list.

', NULL),
(17, 1, 'Stacks, Queues and Hash Tables', 'stacks-queues-hashtables', 't', 'You can build all kinds of things using the flexibility of a linked list. In this video we''ll get to know a few of the more common data structures that you use every day.', '<h2 id=stacks>Stacks</h2>
<p>Stacks and Queues are basically linked lists with abstractions built in that let you retrieve data in a particular way. A stack, for instance, lets you &quot;stack&quot; data on to it but will only let you pull data off of the top - just like a stack of plates. The methods that you associate with a stack are <code>push</code> and <code>pop</code>: you &quot;push&quot; something onto the stack and &quot;pop&quot; off the top of the stack. This is also known as &quot;Last In, First Out&quot; or LIFO.</p>
<h2 id=queues>Queues</h2>
<p>A queue has the same kind of data access rule, but instead of popping off the top you can <em>only</em> pull from the bottom of the queue, also known as &quot;dequeuing&quot;. The two methods associated with a queue are <code>enqueue</code> and <code>dequeue</code> - just like waiting in line (or a queue) for a movie.</p>
<h2 id=hash-tables>Hash Tables</h2>
<p>If you&#39;ve worked with JavaScript objects in the past, you&#39;ve worked with hash tables. They have a specific data access pattern: <em>you access each value with a particular key</em>. These objects are associated with a particular time complexity - do you know what that would be?</p>
', 'Data Structures and Algorithms', 16, 394, '416743616', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/416743616/1de98cfa82', '2023-03-19 09:49:30.14243-07', '2023-03-19 09:49:30.14243-07', '## Stacks

Stacks and Queues are basically linked lists with abstractions built in that let you retrieve data in a particular way. A stack, for instance, lets you stack data on to it but will only let you pull data off of the top - just like a stack of plates. The methods that you associate with a stack are `push` and `pop`: you push something onto the stack and pop off the top of the stack. This is also known as Last In, First Out or LIFO.

## Queues

A queue has the same kind of data access rule, but instead of popping off the top you can _only_ pull from the bottom of the queue, also known as dequeuing. The two methods associated with a queue are `enqueue` and `dequeue` - just like waiting in line (or a queue) for a movie.

## Hash Tables

If you''ve worked with JavaScript objects in the past, you''ve worked with hash tables. They have a specific data access pattern: _you access each value with a particular key_. These objects are associated with a particular time complexity - do you know what that would be?
', NULL),
(18, 1, 'Trees, Binary Trees and Graphs', 'binary-trees-and-graphs', 'f', 'The bread and butter of technical interview questions. If you''re going for a job at Google, Microsoft, Amazon or Facebook - you can be almost guaranteed to be asked a question that used a binary tree of some kind.', '<p>In this video we&#39;ll get into the more complex data structures called &quot;Graphs&quot;. The simplest graph is known as a tree and you likely know exactly what that is because you&#39;re used to looking for files in your computer - which are stored in a tree data structure.</p>
<p>There are different kinds of trees with different rules to them. We&#39;ll explore the common ones including the plain old tree and the binary tree - one that you&#39;ll probably have to use in your interview.</p>
', 'Data Structures and Algorithms', 17, 448, '416743546', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/416743546/7d63dd6643', '2023-03-19 09:49:30.148646-07', '2023-03-19 09:49:30.148646-07', 'In this video we''ll get into the more complex data structures called Graphs. The simplest graph is known as a tree and you likely know exactly what that is because you''re used to looking for files in your computer - which are stored in a tree data structure.

There are different kinds of trees with different rules to them. We''ll explore the common ones including the plain old tree and the binary tree - one that you''ll probably have to use in your interview.
', NULL),
(19, 1, 'Basic Sorting Algorithms', 'basic-sorting-algorithms', 't', 'You will likely *never* need to implement a sorting algorithm - but understanding how they work could come in handy at some point. Interviews and workarounds for framework problems come to mind. ', '<p>You will likely never have to write a search algorithm, except when you&#39;re in an interview. In fact, just yesterday, I was talking to a colleague of mine at Microsoft (a super talented engineer) and he shared with me that he was asked to write a Bubble Sort routine! On a white board!</p>
<p>Interviewers ask this question because they want to see how you write code. If they ask you to write Bubble Sort, consider yourself lucky! They&#39;re giving you a softball.</p>
<p>Not everyone can remember this algorithm so be sure to ask questions... it&#39;s OK. Also: remember they just want to see how you think through a problem, so chill out and answer as best you can.</p>
<h2 id=divide-and-conquer>Divide and Conquer</h2>
<p>As you go through these sorting and searching algorithms, see if you can spot the &quot;divide and conquer&quot; approach being used. This concept is the foundation of so many optimizations in computer science - database indexes, for instance.</p>
<p>Divide and conquer is <em>algorithmic</em> which is a massive improvement over <em>linear</em> time complexity. Do you know what that means and why? We&#39;ll get into it!</p>
', 'Data Structures and Algorithms', 18, 791, '416752701', NULL, '2e6c5c2620e8e4e97042984de0059f66', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/416752701/d35b6b04d0', '2023-03-19 09:49:30.150299-07', '2023-03-19 09:49:30.150299-07', 'You will likely never have to write a search algorithm, except when you''re in an interview. In fact, just yesterday, I was talking to a colleague of mine at Microsoft (a super talented engineer) and he shared with me that he was asked to write a Bubble Sort routine! On a white board!

Interviewers ask this question because they want to see how you write code. If they ask you to write Bubble Sort, consider yourself lucky! They''re giving you a softball.

Not everyone can remember this algorithm so be sure to ask questions... it''s OK. Also: remember they just want to see how you think through a problem, so chill out and answer as best you can.

## Divide and Conquer

As you go through these sorting and searching algorithms, see if you can spot the divide and conquer approach being used. This concept is the foundation of so many optimizations in computer science - database indexes, for instance.

Divide and conquer is _algorithmic_ which is a massive improvement over _linear_ time complexity. Do you know what that means and why? We''ll get into it!
', NULL),
(20, 1, 'DFS, BFS and Binary Tree Search', 'dfs-bfs-and-binary-tree-search', 't', 'You now know all about trees and graphs - but how do you use them? With search and traversal algorithms of course! This is the next part you''ll need to know when you''re asked a traversal question in an interview. And you will be. ', '<p>When I interviewed at Google in 2015 I was asked a Depth-first search question. I couldn&#39;t believe it! I actually giggled about it - but not in a condescending way - I had just read an article that stated flatly &quot;if you interview at Google, you better know your binary tree algorithms&quot; and boom! There it was.</p>
<p>The question had to do with lines of succession in a royal family tree and it was a lot of fun to work through it. Believe it or not I enjoyed it and the interviewer seemed to be happy with my answer!</p>
<p>Another super popular interview is question is about balancing a binary tree. You usually find these questions in the screening phase - they&#39;re considered a little easier to deal with than the more complex questions we&#39;ll tackle later on.</p>
<p>To balance a binary tree you&#39;ll need to know how to efficiently traverse it - that&#39;s where depth-first and it&#39;s couterpart breadth-first search come in.</p>
', 'Data Structures and Algorithms', 19, 880, '416753526', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/416743546/7d63dd6643', '2023-03-19 09:49:30.151345-07', '2023-03-19 09:49:30.151345-07', 'When I interviewed at Google in 2015 I was asked a Depth-first search question. I couldn''t believe it! I actually giggled about it - but not in a condescending way - I had just read an article that stated flatly if you interview at Google, you better know your binary tree algorithms and boom! There it was.

The question had to do with lines of succession in a royal family tree and it was a lot of fun to work through it. Believe it or not I enjoyed it and the interviewer seemed to be happy with my answer!

Another super popular interview is question is about balancing a binary tree. You usually find these questions in the screening phase - they''re considered a little easier to deal with than the more complex questions we''ll tackle later on.

To balance a binary tree you''ll need to know how to efficiently traverse it - that''s where depth-first and it''s couterpart breadth-first search come in.
', NULL),
(21, 1, 'Dynamic Programming and Fibonnaci', 'dynamic-programming-and-fibonnaci', 't', 'Dynamic programming gives us a way to elegantly create algorithms for various problems and can greatly improve the way you solve problems in your daily work. It can also help you ace an interview.', '<p>No, this video is not about Ruby, Python, JavaScript, etc. Dynamic programming is a way to solve a problem using an algorithm in a fairly prescribed way. It sounds complicated, but it’s anything but.</p>
<p>Dynamic programming gives us a way to elegantly create algorithms for various problems and can greatly improve the way you solve problems in your daily work. It can also help you ace an interview.</p>
<p>You knew Fibonacci was going to come up in this book at some point didn’t you! Well, here it is. I’m using it here because it’s the simplest way to convey the dynamic programming process. Also: you will be asked how to solve Fibonacci at some point in your career, and you’re about to get three different approaches!</p>
<p>Which leads right to a great opening point: our jobs are about solving problems. When you go to these interviews, they mostly want to see how you would go about solving something complex. As it turns out, the Interviewing For Dummies book says that Fibonacci is a great question for just that case.</p>
<h2 id=the-code>The Code</h2>
<pre><code class=language-js><span class=hljs-comment>//Fibonacci with Dynamic Programming</span>
<span class=hljs-keyword>const</span> <span class=hljs-title function_>calculateFibAt</span> = (<span class=hljs-params>n</span>) =&gt;{
  <span class=hljs-keyword>var</span> memoTable = [<span class=hljs-number>0</span>,<span class=hljs-number>1</span>];
  <span class=hljs-keyword>for</span>(<span class=hljs-keyword>var</span> i=<span class=hljs-number>2</span>;i&lt;=n;i++){
    memoTable.<span class=hljs-title function_>push</span>(memoTable[i-<span class=hljs-number>2</span>] + memoTable[i-<span class=hljs-number>1</span>])
  }
  <span class=hljs-keyword>return</span> memoTable;
};
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-title function_>calculateFibAt</span>(<span class=hljs-number>1000</span>));


<span class=hljs-comment>//slow, recursive way</span>
<span class=hljs-keyword>const</span> <span class=hljs-title function_>fibSlow</span> = n =&gt; n &lt; <span class=hljs-number>2</span> ? n : <span class=hljs-title function_>fibSlow</span>(n-<span class=hljs-number>2</span>) + <span class=hljs-title function_>fibSlow</span>(n-<span class=hljs-number>1</span>);

<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-title function_>fibSlow</span>(<span class=hljs-number>10</span>));
</code></pre>
', 'Data Structures and Algorithms', 20, 580, '206300155', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/206300155/a781f4b7c6', '2023-03-19 09:49:30.152233-07', '2023-03-19 09:49:30.152233-07', 'No, this video is not about Ruby, Python, JavaScript, etc. Dynamic programming is a way to solve a problem using an algorithm in a fairly prescribed way. It sounds complicated, but it’s anything but.

Dynamic programming gives us a way to elegantly create algorithms for various problems and can greatly improve the way you solve problems in your daily work. It can also help you ace an interview.

You knew Fibonacci was going to come up in this book at some point didn’t you! Well, here it is. I’m using it here because it’s the simplest way to convey the dynamic programming process. Also: you will be asked how to solve Fibonacci at some point in your career, and you’re about to get three different approaches!

Which leads right to a great opening point: our jobs are about solving problems. When you go to these interviews, they mostly want to see how you would go about solving something complex. As it turns out, the Interviewing For Dummies book says that Fibonacci is a great question for just that case.

## The Code

```js
//Fibonacci with Dynamic Programming
const calculateFibAt = (n) =>{
  var memoTable = [0,1];
  for(var i=2;i<=n;i++){
    memoTable.push(memoTable[i-2] + memoTable[i-1])
  }
  return memoTable;
};
console.log(calculateFibAt(1000));


//slow, recursive way
const fibSlow = n => n < 2 ? n : fibSlow(n-2) + fibSlow(n-1);

console.log(fibSlow(10));
```
', NULL),
(22, 1, 'Calculating Prime Numbers', 'calculating-primes', 'f', 'The use of prime numbers is everywhere in computer science... in fact you''re using them right now to connect to this website, read your email and send text messages.', '<p>This problem has been solved (rather elegantly I might add) over 2200 years ago by a chap named Eratosthenes. His algorithm is so elegant that just about anyone can understand it. In mathematical terms, his algorithm uses a <a href=https://en.wikipedia.org/wiki/Sieve_theory>sieve</a> to filter and extract the numbers in a set:</p>
<blockquote>
<p>Sieve theory is a set of general techniques in number theory, designed to count, or more realistically to estimate the size of, sifted sets of integers. The primordial example of a sifted set is the set of prime numbers up to some prescribed limit X.</p>
</blockquote>
<p>How would you solve this problem? Also: <em>would you consider this dynamic programming</em>? We’ll answer the latter question at the very end.</p>
<h2 id=the-code>The Code</h2>
<pre><code class=language-js><span class=hljs-comment>//Sieve of Eratosthenes</span>
<span class=hljs-keyword>const</span> <span class=hljs-title function_>sieve</span> = (<span class=hljs-params>n</span>) =&gt; {
  <span class=hljs-keyword>var</span> grid = {};
  <span class=hljs-keyword>for</span> (<span class=hljs-keyword>var</span> i = <span class=hljs-number>2</span>; i &lt;= n; i++) {
    grid[i]={<span class=hljs-attr>marked</span>: <span class=hljs-literal>false</span>};
  }
  <span class=hljs-keyword>const</span> limit = <span class=hljs-title class_>Math</span>.<span class=hljs-title function_>sqrt</span>(n);
  <span class=hljs-keyword>for</span> (<span class=hljs-keyword>var</span> i = <span class=hljs-number>2</span>; i &lt;= limit; i++) {
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>var</span> x = i + i; x &lt;= n; x += i){
      grid[x].<span class=hljs-property>marked</span> = <span class=hljs-literal>true</span>;
    }
  }
  <span class=hljs-keyword>var</span> out =[];
  <span class=hljs-keyword>for</span> (<span class=hljs-keyword>var</span> i = <span class=hljs-number>2</span>; i &lt;= n; i++) {
    <span class=hljs-keyword>if</span>(!grid[i].<span class=hljs-property>marked</span>) out.<span class=hljs-title function_>push</span>(i);
  }
  <span class=hljs-keyword>return</span> out;
};
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-title function_>sieve</span>(<span class=hljs-number>100</span>));
</code></pre>
', 'Data Structures and Algorithms', 21, 353, '206299670', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/206299670/742ada0979', '2023-03-19 09:49:30.153301-07', '2023-03-19 09:49:30.153301-07', 'This problem has been solved (rather elegantly I might add) over 2200 years ago by a chap named Eratosthenes. His algorithm is so elegant that just about anyone can understand it. In mathematical terms, his algorithm uses a [sieve](https://en.wikipedia.org/wiki/Sieve_theory) to filter and extract the numbers in a set:

> Sieve theory is a set of general techniques in number theory, designed to count, or more realistically to estimate the size of, sifted sets of integers. The primordial example of a sifted set is the set of prime numbers up to some prescribed limit X.

How would you solve this problem? Also: *would you consider this dynamic programming*? We’ll answer the latter question at the very end.

## The Code

```js
//Sieve of Eratosthenes
const sieve = (n) => {
  var grid = {};
  for (var i = 2; i <= n; i++) {
    grid[i]={marked: false};
  }
  const limit = Math.sqrt(n);
  for (var i = 2; i <= limit; i++) {
    for(var x = i + i; x <= n; x += i){
      grid[x].marked = true;
    }
  }
  var out =[];
  for (var i = 2; i <= n; i++) {
    if(!grid[i].marked) out.push(i);
  }
  return out;
};
console.log(sieve(100));
```
', NULL),
(23, 1, 'Graph Traversal: Bellman Ford', 'graph-traversal-bellman-ford', 'f', 'How can you traverse a graph ensuring you take the route with the lowest cost? The Bellman-Ford algorithm will answer this question.', '<p>One of the most fascinating uses of graphs is in the optimization of path traversal, which can be used in a vast number of calculations.</p>
<p>As mentioned in the previous chapter, graphs can be used to represent all kinds of information:</p>
<ul>
<li>A network of any kind. Social (friends) or digital (computers or the internet), for example</li>
<li>A decision tree</li>
<li>Contributions from members of any kind to a cause of any kind</li>
<li>Atomic interactions in physics, chemistry or biology</li>
</ul>
<p>Navigation between various endpoints - If you apply weighting to the edges or vertices, you can run useful calculations for just about anything. One of the most common is finding the shortest path between two vertices.</p>
<pre><code class=language-js><span class=hljs-comment>//Bellman-Ford: Shortest path calculation</span>
<span class=hljs-comment>//on an edge-weighted, directed graph</span>
<span class=hljs-keyword>const</span> vertices = [<span class=hljs-string>&quot;S&quot;</span>, <span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-string>&quot;B&quot;</span>, <span class=hljs-string>&quot;C&quot;</span>, <span class=hljs-string>&quot;D&quot;</span>, <span class=hljs-string>&quot;E&quot;</span>];
<span class=hljs-keyword>var</span> memo = {
  <span class=hljs-attr>S</span>:<span class=hljs-number>0</span>,
  <span class=hljs-attr>A</span>:<span class=hljs-title class_>Number</span>.<span class=hljs-property>POSITIVE_INFINITY</span>,
  <span class=hljs-attr>B</span>:<span class=hljs-title class_>Number</span>.<span class=hljs-property>POSITIVE_INFINITY</span>,
  <span class=hljs-attr>C</span>:<span class=hljs-title class_>Number</span>.<span class=hljs-property>POSITIVE_INFINITY</span>,
  <span class=hljs-attr>D</span>:<span class=hljs-title class_>Number</span>.<span class=hljs-property>POSITIVE_INFINITY</span>,
  <span class=hljs-attr>E</span>:<span class=hljs-title class_>Number</span>.<span class=hljs-property>POSITIVE_INFINITY</span>
};
<span class=hljs-keyword>const</span> graph = [
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;S&quot;</span>, to : <span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>4</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;S&quot;</span>, to :<span class=hljs-string>&quot;E&quot;</span>, <span class=hljs-attr>cost</span>: -<span class=hljs-number>5</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;A&quot;</span>, to :<span class=hljs-string>&quot;C&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>6</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;B&quot;</span>, to :<span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>3</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;C&quot;</span>, to :<span class=hljs-string>&quot;B&quot;</span>, <span class=hljs-attr>cost</span>: -<span class=hljs-number>2</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;D&quot;</span>, to :<span class=hljs-string>&quot;C&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>3</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;D&quot;</span>, to :<span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>10</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;E&quot;</span>, <span class=hljs-attr>to</span>: <span class=hljs-string>&quot;D&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>8</span>}
];

<span class=hljs-keyword>const</span> <span class=hljs-title function_>iterate</span> = (<span class=hljs-params></span>) =&gt; {
  <span class=hljs-keyword>var</span> doItAgain = <span class=hljs-literal>false</span>;
  <span class=hljs-keyword>for</span>(fromVertex <span class=hljs-keyword>of</span> vertices){
    <span class=hljs-keyword>const</span> edges = graph.<span class=hljs-title function_>filter</span>(<span class=hljs-function><span class=hljs-params>path</span> =&gt;</span> {
      <span class=hljs-keyword>return</span> path.<span class=hljs-property>from</span> === fromVertex;
    });
    <span class=hljs-keyword>for</span>(edge <span class=hljs-keyword>of</span> edges){
      <span class=hljs-keyword>const</span> potentialCost = memo[edge.<span class=hljs-property>from</span>] + edge.<span class=hljs-property>cost</span>;
      <span class=hljs-keyword>if</span>(potentialCost &lt; memo[edge.<span class=hljs-property>to</span>]){
        memo[edge.<span class=hljs-property>to</span>] = potentialCost;
        doItAgain = <span class=hljs-literal>true</span>;
      }
    }
  }
  <span class=hljs-keyword>return</span> doItAgain;
}
<span class=hljs-keyword>for</span>(vertex <span class=hljs-keyword>of</span> vertices){
  <span class=hljs-keyword>if</span>(!<span class=hljs-title function_>iterate</span>()) <span class=hljs-keyword>break</span>;
}
<span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(memo);
</code></pre>
', 'Data Structures and Algorithms', 22, 495, '207341876', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207341876/07de335d67', '2023-03-19 09:49:30.154475-07', '2023-03-19 09:49:30.154475-07', 'One of the most fascinating uses of graphs is in the optimization of path traversal, which can be used in a vast number of calculations.

As mentioned in the previous chapter, graphs can be used to represent all kinds of information:

 - A network of any kind. Social (friends) or digital (computers or the internet), for example
 - A decision tree
 - Contributions from members of any kind to a cause of any kind
 - Atomic interactions in physics, chemistry or biology

Navigation between various endpoints - If you apply weighting to the edges or vertices, you can run useful calculations for just about anything. One of the most common is finding the shortest path between two vertices.

```js
//Bellman-Ford: Shortest path calculation
//on an edge-weighted, directed graph
const vertices = [S, A, B, C, D, E];
var memo = {
  S:0,
  A:Number.POSITIVE_INFINITY,
  B:Number.POSITIVE_INFINITY,
  C:Number.POSITIVE_INFINITY,
  D:Number.POSITIVE_INFINITY,
  E:Number.POSITIVE_INFINITY
};
const graph = [
  {from : S, to : A, cost: 4},
  {from : S, to :E, cost: -5},
  {from : A, to :C, cost: 6},
  {from : B, to :A, cost: 3},
  {from : C, to :B, cost: -2},
  {from : D, to :C, cost: 3},
  {from : D, to :A, cost: 10},
  {from : E, to: D, cost: 8}
];

const iterate = () => {
  var doItAgain = false;
  for(fromVertex of vertices){
    const edges = graph.filter(path => {
      return path.from === fromVertex;
    });
    for(edge of edges){
      const potentialCost = memo[edge.from] + edge.cost;
      if(potentialCost < memo[edge.to]){
        memo[edge.to] = potentialCost;
        doItAgain = true;
      }
    }
  }
  return doItAgain;
}
for(vertex of vertices){
  if(!iterate()) break;
}
console.log(memo);
```
', NULL),
(24, 1, 'Graph Traversal: Dijkstra', 'graph-traversal-dijkstra', 'f', 'Bellman-Ford works well but it takes too long and your graph can''t have cycles. Dijkstra solved this problem with an elegant solution.', '<p>In the last chapter we iterated over a simple graph using Bellman-Ford to find the shortest paths from a single vertex (our source) to all other vertices in the graph.</p>
<p>The complexity of Bellman-Ford is <code>O(|V| E)</code>, which can approximate <code>O(n^2)</code> if every vertex has at least one outgoing edge. In other words: it&#39;s not terribly efficient.</p>
<p>Dijkstra&#39;s algorithm requires only one iteration, however and has a complexity of <code>O(|V| log V)</code>, which is much more efficient.</p>
<p>As with Bellman-Ford, we&#39;ll use a directed, weighted graph with 6 vertices. In addition, we&#39;ll setup a memo table with our source S set to 0 and the rest of the vertices set to infinity.</p>
<p>There is a difference here, however, and it&#39;s critical! Dijkstra doesn&#39;t work with negative edge weights! I have adjusted this graph so that we don&#39;t have any negative weights, as you can see. Specifically the edges between S and E as well as C to B. In addition I&#39;ve added a few edges to show that the algorithm will scale easily regardless of the number of edges involved.</p>
<pre><code class=language-js><span class=hljs-comment>//Dijkstra: Shortest path calculation</span>
<span class=hljs-comment>//on an edge-weighted, directed graph</span>
<span class=hljs-keyword>class</span> <span class=hljs-title class_>MemoTable</span>{
  <span class=hljs-title function_>constructor</span>(<span class=hljs-params>vertices</span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>S</span> = {<span class=hljs-attr>name</span>: <span class=hljs-string>&quot;S&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>0</span>, <span class=hljs-attr>visited</span>: <span class=hljs-literal>false</span>};
    <span class=hljs-variable language_>this</span>.<span class=hljs-property>table</span> = [<span class=hljs-variable language_>this</span>.<span class=hljs-property>S</span>];
    <span class=hljs-keyword>for</span>(<span class=hljs-keyword>var</span> vertex <span class=hljs-keyword>of</span> vertices){
      <span class=hljs-variable language_>this</span>.<span class=hljs-property>table</span>.<span class=hljs-title function_>push</span>({<span class=hljs-attr>name</span>: vertex, <span class=hljs-attr>cost</span>: <span class=hljs-title class_>Number</span>.<span class=hljs-property>POSITIVE_INFINITY</span>, <span class=hljs-attr>visited</span>: <span class=hljs-literal>false</span>});
    }
  };
  <span class=hljs-title function_>getCandidateVertices</span>(<span class=hljs-params></span>){
   <span class=hljs-keyword>return</span> <span class=hljs-variable language_>this</span>.<span class=hljs-property>table</span>.<span class=hljs-title function_>filter</span>(<span class=hljs-function><span class=hljs-params>entry</span> =&gt;</span> {
     <span class=hljs-keyword>return</span> entry.<span class=hljs-property>visited</span> === <span class=hljs-literal>false</span>;
   });
  };
  <span class=hljs-title function_>nextVertex</span>(<span class=hljs-params></span>){
   <span class=hljs-keyword>const</span> candidates = <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>getCandidateVertices</span>();
   <span class=hljs-keyword>if</span>(candidates.<span class=hljs-property>length</span> &gt; <span class=hljs-number>0</span>){
     <span class=hljs-keyword>return</span> candidates.<span class=hljs-title function_>reduce</span>(<span class=hljs-function>(<span class=hljs-params>prev, curr</span>) =&gt;</span> {
       <span class=hljs-keyword>return</span> prev.<span class=hljs-property>cost</span> &lt; curr.<span class=hljs-property>cost</span> ? prev : curr;
     });
   }<span class=hljs-keyword>else</span>{
     <span class=hljs-keyword>return</span> <span class=hljs-literal>null</span>;
   }
  };
  <span class=hljs-title function_>setCurrentCost</span>(<span class=hljs-params>vertex, cost</span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>getEntry</span>(vertex).<span class=hljs-property>cost</span> =cost;
  };
  <span class=hljs-title function_>setAsVisited</span>(<span class=hljs-params>vertex</span>){
    <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>getEntry</span>(vertex).<span class=hljs-property>visited</span> = <span class=hljs-literal>true</span>;
  };
  <span class=hljs-title function_>getEntry</span>(<span class=hljs-params>vertex</span>){
    <span class=hljs-keyword>return</span> <span class=hljs-variable language_>this</span>.<span class=hljs-property>table</span>.<span class=hljs-title function_>find</span>(<span class=hljs-function><span class=hljs-params>entry</span> =&gt;</span> entry.<span class=hljs-property>name</span> == vertex);
  };
  <span class=hljs-title function_>getCost</span>(<span class=hljs-params>vertex</span>){
    <span class=hljs-keyword>return</span> <span class=hljs-variable language_>this</span>.<span class=hljs-title function_>getEntry</span>(vertex).<span class=hljs-property>cost</span>;
  };
  <span class=hljs-title function_>toString</span>(<span class=hljs-params></span>){
    <span class=hljs-variable language_>console</span>.<span class=hljs-title function_>log</span>(<span class=hljs-variable language_>this</span>.<span class=hljs-property>table</span>);
  }
};
<span class=hljs-keyword>const</span> vertices = [<span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-string>&quot;B&quot;</span>,<span class=hljs-string>&quot;C&quot;</span>, <span class=hljs-string>&quot;D&quot;</span>, <span class=hljs-string>&quot;E&quot;</span>];
<span class=hljs-keyword>const</span> graph = [
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;S&quot;</span>, to :<span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>4</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;S&quot;</span>, to :<span class=hljs-string>&quot;E&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>2</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;A&quot;</span>, to :<span class=hljs-string>&quot;D&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>3</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;A&quot;</span>, to :<span class=hljs-string>&quot;C&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>6</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;A&quot;</span>, to :<span class=hljs-string>&quot;B&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>5</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;B&quot;</span>, to :<span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>3</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;C&quot;</span>, to :<span class=hljs-string>&quot;B&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>1</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;D&quot;</span>, to :<span class=hljs-string>&quot;C&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>3</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;D&quot;</span>, to :<span class=hljs-string>&quot;A&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>1</span>},
  {<span class=hljs-keyword>from</span> : <span class=hljs-string>&quot;E&quot;</span>, <span class=hljs-attr>to</span>: <span class=hljs-string>&quot;D&quot;</span>, <span class=hljs-attr>cost</span>: <span class=hljs-number>1</span>}
]
<span class=hljs-keyword>const</span> memo = <span class=hljs-keyword>new</span> <span class=hljs-title class_>MemoTable</span>(vertices);
<span class=hljs-keyword>const</span> <span class=hljs-title function_>evaluate</span> = vertex =&gt; {
  <span class=hljs-keyword>const</span> edges = graph.<span class=hljs-title function_>filter</span>(<span class=hljs-function><span class=hljs-params>path</span> =&gt;</span> {
    <span class=hljs-keyword>return</span> path.<span class=hljs-property>from</span> === vertex.<span class=hljs-property>name</span>;
  });
  <span class=hljs-keyword>for</span>(edge <span class=hljs-keyword>of</span> edges){
    <span class=hljs-keyword>const</span> currentVertexCost = memo.<span class=hljs-title function_>getCost</span>(edge.<span class=hljs-property>from</span>);
    <span class=hljs-keyword>const</span> toVertexCost = memo.<span class=hljs-title function_>getCost</span>(edge.<span class=hljs-property>to</span>);
    <span class=hljs-keyword>const</span> tentativeCost = currentVertexCost + edge.<span class=hljs-property>cost</span>;
    <span class=hljs-keyword>if</span>(tentativeCost &lt; toVertexCost){
      memo.<span class=hljs-title function_>setCurrentCost</span>(edge.<span class=hljs-property>to</span>, tentativeCost);
    }
  };
  memo.<span class=hljs-title function_>setAsVisited</span>(vertex.<span class=hljs-property>name</span>);
  <span class=hljs-keyword>const</span> next = memo.<span class=hljs-title function_>nextVertex</span>();
  <span class=hljs-keyword>if</span>(next) evaluate(next);
}
<span class=hljs-comment>//kick it off from the source vertex</span>
evaluate(memo.<span class=hljs-property>S</span>);
memo.<span class=hljs-title function_>toString</span>();
</code></pre>
', 'Data Structures and Algorithms', 23, 495, '206465252', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/206465252/33d8f4f7ca', '2023-03-19 09:49:30.156048-07', '2023-03-19 09:49:30.156048-07', 'In the last chapter we iterated over a simple graph using Bellman-Ford to find the shortest paths from a single vertex (our source) to all other vertices in the graph.

The complexity of Bellman-Ford is `O(|V| E)`, which can approximate `O(n^2)` if every vertex has at least one outgoing edge. In other words: it''s not terribly efficient.

Dijkstra''s algorithm requires only one iteration, however and has a complexity of `O(|V| log V)`, which is much more efficient.

As with Bellman-Ford, we''ll use a directed, weighted graph with 6 vertices. In addition, we''ll setup a memo table with our source S set to 0 and the rest of the vertices set to infinity.

There is a difference here, however, and it''s critical! Dijkstra doesn''t work with negative edge weights! I have adjusted this graph so that we don''t have any negative weights, as you can see. Specifically the edges between S and E as well as C to B. In addition I''ve added a few edges to show that the algorithm will scale easily regardless of the number of edges involved.

```js
//Dijkstra: Shortest path calculation
//on an edge-weighted, directed graph
class MemoTable{
  constructor(vertices){
    this.S = {name: S, cost: 0, visited: false};
    this.table = [this.S];
    for(var vertex of vertices){
      this.table.push({name: vertex, cost: Number.POSITIVE_INFINITY, visited: false});
    }
  };
  getCandidateVertices(){
   return this.table.filter(entry => {
     return entry.visited === false;
   });
  };
  nextVertex(){
   const candidates = this.getCandidateVertices();
   if(candidates.length > 0){
     return candidates.reduce((prev, curr) => {
       return prev.cost < curr.cost ? prev : curr;
     });
   }else{
     return null;
   }
  };
  setCurrentCost(vertex, cost){
    this.getEntry(vertex).cost =cost;
  };
  setAsVisited(vertex){
    this.getEntry(vertex).visited = true;
  };
  getEntry(vertex){
    return this.table.find(entry => entry.name == vertex);
  };
  getCost(vertex){
    return this.getEntry(vertex).cost;
  };
  toString(){
    console.log(this.table);
  }
};
const vertices = [A, B,C, D, E];
const graph = [
  {from : S, to :A, cost: 4},
  {from : S, to :E, cost: 2},
  {from : A, to :D, cost: 3},
  {from : A, to :C, cost: 6},
  {from : A, to :B, cost: 5},
  {from : B, to :A, cost: 3},
  {from : C, to :B, cost: 1},
  {from : D, to :C, cost: 3},
  {from : D, to :A, cost: 1},
  {from : E, to: D, cost: 1}
]
const memo = new MemoTable(vertices);
const evaluate = vertex => {
  const edges = graph.filter(path => {
    return path.from === vertex.name;
  });
  for(edge of edges){
    const currentVertexCost = memo.getCost(edge.from);
    const toVertexCost = memo.getCost(edge.to);
    const tentativeCost = currentVertexCost + edge.cost;
    if(tentativeCost < toVertexCost){
      memo.setCurrentCost(edge.to, tentativeCost);
    }
  };
  memo.setAsVisited(vertex.name);
  const next = memo.nextVertex();
  if(next) evaluate(next);
}
//kick it off from the source vertex
evaluate(memo.S);
memo.toString();
```
', NULL),
(25, 1, 'Design Patterns: Creational', 'design-patterns-creational', 'f', 'Tried and true design patterns for creating objects in an object-oriented language.', '<p>People have been writing code in object-oriented languages for a long time and, as you might guess, have figured out common ways to solve common problems. These are called design patterns and there are quite a few of them.</p>
<p>In 1994 a group of programmers got together and started discussing various patterns they had discovered in the code they were writing. In the same way that the Romans created the arch and Brunelleschi created a massive dome – the Gang of Four (as they became known) gave object-oriented programmers a set of blue prints from which to construct their code. The Gang of Four are:</p>
<ul>
<li>Erich Gamma</li>
<li>Richard Helm</li>
<li>Ralph Johnson</li>
<li>John Vlissedes</li>
</ul>
<p>Let&#39;s have a look at the most common design patterns that I&#39;ve used and had to know about during my career. I&#39;ll be using ES6 here because … well why not? Also, these patterns apply primarily to object-oriented programming (OOP) and are easily adaptable to JavaScrpt.</p>
<h2 id=creational-patterns>Creational Patterns</h2>
<p>When working with an OO language you need to create objects. It&#39;s a simple operation, but sometimes having some rules in place will help create the correct object, with the proper state and context.</p>
<h2 id=the-code>The Code</h2>
<p>You can find the code for <a href=https://github.com/imposters-handbook/videos/tree/master/patterns/creational>each of the demos up on GitHub</a>.</p>
', 'Software Design', 24, 1210, '207695623', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207695623/f9a8e8da63', '2023-03-19 09:49:30.158203-07', '2023-03-19 09:49:30.158203-07', 'People have been writing code in object-oriented languages for a long time and, as you might guess, have figured out common ways to solve common problems. These are called design patterns and there are quite a few of them.

In 1994 a group of programmers got together and started discussing various patterns they had discovered in the code they were writing. In the same way that the Romans created the arch and Brunelleschi created a massive dome – the Gang of Four (as they became known) gave object-oriented programmers a set of blue prints from which to construct their code. The Gang of Four are:

 - Erich Gamma
 - Richard Helm
 - Ralph Johnson
 - John Vlissedes

Let''s have a look at the most common design patterns that I''ve used and had to know about during my career. I''ll be using ES6 here because … well why not? Also, these patterns apply primarily to object-oriented programming (OOP) and are easily adaptable to JavaScrpt.

## Creational Patterns

When working with an OO language you need to create objects. It''s a simple operation, but sometimes having some rules in place will help create the correct object, with the proper state and context.

## The Code

You can find the code for [each of the demos up on GitHub](https://github.com/imposters-handbook/videos/tree/master/patterns/creational).
', NULL),
(26, 1, 'Design Patterns: Structural', 'design-patterns-structural', 'f', 'As your application grows in size you need to have a plan to handle the increase in complexity. The Gang of Four have some ideas that could work for you.', '<p>Code needs to have some structure, so we use things like methods, modules, and classes. As code becomes more complex, these modules and classes might also need some structure to reduce confusion and unneeded complexity. That&#39;s what we&#39;ll take a look at here.</p>
<h2 id=the-code>The Code</h2>
<p>You can find the code for <a href=https://github.com/imposters-handbook/videos/tree/master/patterns/structural>each of the demos up on GitHub</a>.</p>
', 'Software Design', 25, 842, '207850774', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207850774/ce2dac37be', '2023-03-19 09:49:30.165778-07', '2023-03-19 09:49:30.165778-07', 'Code needs to have some structure, so we use things like methods, modules, and classes. As code becomes more complex, these modules and classes might also need some structure to reduce confusion and unneeded complexity. That''s what we''ll take a look at here.

## The Code

You can find the code for [each of the demos up on GitHub](https://github.com/imposters-handbook/videos/tree/master/patterns/structural).
', NULL),
(27, 1, 'Design Patterns: Behavioral', 'design-patterns-behavioral', 'f', 'Mediators, Decorators and Facades - this is the deep end of object-oriented programming and something you''ll come face to face with as your application grows.', '<p>We&#39;ve figured out various ways to create our classes as well as how to enable functionality by structuring things a certain way. Now let&#39;s see how we can use patterns to simplify how clients can use the code we&#39;ve written.</p>
<h2 id=the-code>The Code</h2>
<p>You can find the code for <a href=https://github.com/imposters-handbook/videos/tree/master/patterns/behavioral>each of the demos up on GitHub</a>.</p>
', 'Software Design', 26, 1007, '207865583', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207865583/8c0eaedbce', '2023-03-19 09:49:30.167644-07', '2023-03-19 09:49:30.167644-07', 'We''ve figured out various ways to create our classes as well as how to enable functionality by structuring things a certain way. Now let''s see how we can use patterns to simplify how clients can use the code we''ve written.

## The Code

You can find the code for [each of the demos up on GitHub](https://github.com/imposters-handbook/videos/tree/master/patterns/behavioral).
', NULL),
(28, 1, 'Principles of Software Design', 'principles-of-software-design', 'f', 'You''ve heard the terms before: YAGNI, SOLID, Tell Don''t ASK, DRY... what are they and what do they mean?', '<p>As you build applications using the patterns we learned in the previous videos, you begin to see some common side effects.</p>
<p>For instance: the Strategy, Adapter, Mediator and Bridge Patterns lead you to think a little bit more about better ways to manage dependencies between classes. You also begin to create rules and reasons why code should even exist in the first place.</p>
<p>Obviously, this is not a small topic. In this chapter we&#39;ll discover the key principles you should understand, who came up with them, and why. These concepts include Coupling, Cohesion, Tell Don&#39;t Ask, YAGNI, and SOLID.</p>
<h2 id=the-code>The Code</h2>
<p>You can find the code for <a href=https://github.com/imposters-handbook/videos/tree/master/design_principles>each of the demos up on GitHub</a>.</p>
', 'Software Design', 27, 1007, '208257777', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/208257777/b36eb7b725', '2023-03-19 09:49:30.168717-07', '2023-03-19 09:49:30.168717-07', 'As you build applications using the patterns we learned in the previous videos, you begin to see some common side effects.

For instance: the Strategy, Adapter, Mediator and Bridge Patterns lead you to think a little bit more about better ways to manage dependencies between classes. You also begin to create rules and reasons why code should even exist in the first place.

Obviously, this is not a small topic. In this chapter we''ll discover the key principles you should understand, who came up with them, and why. These concepts include Coupling, Cohesion, Tell Don''t Ask, YAGNI, and SOLID.

## The Code

You can find the code for [each of the demos up on GitHub](https://github.com/imposters-handbook/videos/tree/master/design_principles).
', NULL),
(29, 1, 'Testing Your Code: TDD and BDD', 'testing-your-code-tdd-and-bdd', 'f', 'Testing code has moved beyond the realm of QA and into the realm of design, asking you to think about what you do before you do it. Let''s have a look at some strategies.', '<p>I am, strictly speaking, not a practitioner of Test-driven Design, or TDD. I know what it is, and I know that people like to argue about what they think it is and what they think it is not.</p>
<p>Just show the essence of the idea. I think we can all agree on that, can&#39;t we? For this video I approached a number of friends and asked them about what they considered the essence of TDD to be, and how they think of using it. By the way – each of them hedged their opinions with a variation of &quot;this isn&#39;t strictly TDD… but…&quot;.</p>
<p><strong>TDD requires discipline</strong> and you&#39;re not alone if you sort of do it. As long as you&#39;re testing your code!</p>
<h2 id=the-code>The Code</h2>
<p>You can find the code for <a href=https://github.com/imposters-handbook/videos/tree/master/testing>each of the demos up on GitHub</a>.</p>
', 'Software Design', 28, 1944, '207390386', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207390386/201ac3b189', '2023-03-19 09:49:30.169709-07', '2023-03-19 09:49:30.169709-07', 'I am, strictly speaking, not a practitioner of Test-driven Design, or TDD. I know what it is, and I know that people like to argue about what they think it is and what they think it is not.

Just show the essence of the idea. I think we can all agree on that, can''t we? For this video I approached a number of friends and asked them about what they considered the essence of TDD to be, and how they think of using it. By the way – each of them hedged their opinions with a variation of this isn''t strictly TDD… but….

**TDD requires discipline** and you''re not alone if you sort of do it. As long as you''re testing your code!

## The Code

You can find the code for [each of the demos up on GitHub](https://github.com/imposters-handbook/videos/tree/master/testing).
', NULL),
(30, 1, 'Shell Script Basics', 'shell-script-basics', 'f', 'It''s a Unix world. You should have a functional knowledge of how to get around a Unix machine using the command line, as well as how to complete basic tasks using shell scripts and Make files.', '<p>Shell scripts can help make tedious programming tasks routine, like renaming/resizing images. Make is an old, reliable build tool that can replace (easily) Grunt, Gulp, Rake, Jake and any other language-dependent build tool.</p>
<p>As a developer, having a set of scripts, aliases and binaries in your &quot;dotfiles&quot; is a great way to organize the tools that help you on a daily basis.</p>
<h2 id=why-do-you-have-a-section-on-unix-and-shell-scripts>Why Do You Have a Section On Unix and Shell Scripts?</h2>
<p>The simple answer to that is that there are many, many, many developers who stick to the GUI. They prefer apps and tools to commands. They click &quot;File&quot; and &quot;Edit&quot;, hunting for &quot;Copy&quot; and &quot;Paste&quot;.</p>
<p>You know these people. You were one of these people. This isn&#39;t a judgement of any kind; I stick to the GUI myself far more than I&#39;d care to admit. There&#39;s a better way, a faster more efficient way to work with a computer, and you&#39;ll be a better programmer all around if you learn some basic shell skills.</p>
<p>Unix and Unix-like systems (Linux, BSD, Solaris, RedHat, etc) have been around forever. You simply can&#39;t expect to grow much in your career if you don&#39;t have a basic competency with Unix and its commands. If you don&#39;t believe me, skip right over this chapter. <strong>It&#39;ll be here when you come back, after you&#39;ve realized just how true this is</strong>.</p>
<p>This is an exciting thing! Crawling under the hood of your computer can increase your efficiency dramatically. Shell scripts, Makefiles, server setup routines, quick little commands to update your system, configuring your web/database server remotely over SSH … these are skills you must know.</p>
<p>So let&#39;s wander through the shell. I won&#39;t go into Unix history as I&#39;m just not qualified to do so. I&#39;ll also sidestep the basics of the Unix commands – that&#39;ll be up to you.</p>
<p>Instead, let&#39;s get right to the thing that will help you the most in your job: basic shell scripting skills.</p>
<h2 id=the-code>The Code</h2>
<pre><code class=language-sh><span class=hljs-meta>#!/bin/sh</span>
IMAGES=$(<span class=hljs-built_in>ls</span> ./images/**/*.jpg ./images/**/*.png)
DIST=./dist

<span class=hljs-keyword>if</span> [ -d <span class=hljs-string>&quot;<span class=hljs-variable>$DIST</span>&quot;</span> ]; <span class=hljs-keyword>then</span>
    <span class=hljs-built_in>rm</span> -R <span class=hljs-string>&quot;<span class=hljs-variable>$DIST</span>&quot;</span>
<span class=hljs-keyword>fi</span>

<span class=hljs-built_in>mkdir</span> <span class=hljs-string>&quot;<span class=hljs-variable>$DIST</span>&quot;</span>

<span class=hljs-keyword>for</span> IMG <span class=hljs-keyword>in</span> <span class=hljs-variable>$IMAGES</span>
<span class=hljs-keyword>do</span>
    convert <span class=hljs-variable>$IMG</span> -resize 600x400 <span class=hljs-string>&quot;<span class=hljs-variable>$DIST</span>/<span class=hljs-subst>$(basename $IMG)</span>&quot;</span>
<span class=hljs-keyword>done</span>
</code></pre>
', 'Core Skills', 29, 1904, '207370989', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207370989/21d1ef9f7e', '2023-03-19 09:49:30.170646-07', '2023-03-19 09:49:30.170646-07', 'Shell scripts can help make tedious programming tasks routine, like renaming/resizing images. Make is an old, reliable build tool that can replace (easily) Grunt, Gulp, Rake, Jake and any other language-dependent build tool.

As a developer, having a set of scripts, aliases and binaries in your dotfiles is a great way to organize the tools that help you on a daily basis.

## Why Do You Have a Section On Unix and Shell Scripts?

The simple answer to that is that there are many, many, many developers who stick to the GUI. They prefer apps and tools to commands. They click File and Edit, hunting for Copy and Paste.

You know these people. You were one of these people. This isn''t a judgement of any kind; I stick to the GUI myself far more than I''d care to admit. There''s a better way, a faster more efficient way to work with a computer, and you''ll be a better programmer all around if you learn some basic shell skills.

Unix and Unix-like systems (Linux, BSD, Solaris, RedHat, etc) have been around forever. You simply can''t expect to grow much in your career if you don''t have a basic competency with Unix and its commands. If you don''t believe me, skip right over this chapter. **It''ll be here when you come back, after you''ve realized just how true this is**.

This is an exciting thing! Crawling under the hood of your computer can increase your efficiency dramatically. Shell scripts, Makefiles, server setup routines, quick little commands to update your system, configuring your web/database server remotely over SSH … these are skills you must know.

So let''s wander through the shell. I won''t go into Unix history as I''m just not qualified to do so. I''ll also sidestep the basics of the Unix commands – that''ll be up to you.

Instead, let''s get right to the thing that will help you the most in your job: basic shell scripting skills.

## The Code

```sh
#!/bin/sh
IMAGES=$(ls ./images/**/*.jpg ./images/**/*.png)
DIST=./dist

if [ -d $DIST ]; then
	rm -R $DIST
fi

mkdir $DIST

for IMG in $IMAGES
do
	convert $IMG -resize 600x400 $DIST/$(basename $IMG)
done
```
', NULL),
(31, 1, 'Hands On: Creating a Useful Shell Script', 'hands-on-creating-a-useful-shell-script', 't', 'I use the static site generator Jekyll to write my blog. I store the site at Github, who then translates and hosts it all for me for free. Jekyll is simple to use and I like it a lot. There''s only one problem: it''s a bit manual.', '<p>I use the static site generator Jekyll to write my blog. I store the site at Github, who then translates and hosts it all for me for free. Jekyll is simple to use and I like it a lot. There&#39;s only one problem: it&#39;s a bit manual.</p>
<p>Every post that you create has to have a very specific filename in the form of year-month-day-post-slug.md. Not that big of a problem, just a mere annoyance. In addition, every post you have must have a blob of text at the top called the front matter. Again: not a huge problem, just kind of time consuming. The perfect candidate for a little help from a shell script.</p>
<pre><code class=language-sh><span class=hljs-meta>#!/bin/bash</span>
<span class=hljs-comment># a Jekyll post creator, which creates a new file, adds frontmatter,</span>
<span class=hljs-comment># and opens the editor and starts Jekyll</span>
<span class=hljs-function><span class=hljs-title>new_post</span></span>() {
  JEKYLL_ROOT=~/Documents/Sites/conery-io-jekyll
  JEKYLL_POSTS=<span class=hljs-variable>$JEKYLL_ROOT</span>/_posts
  TITLE=<span class=hljs-variable>$1</span>
  SLUGIFIED=<span class=hljs-string>&quot;<span class=hljs-subst>$(echo -n <span class=hljs-string>&quot;<span class=hljs-variable>$TITLE</span>&quot;</span> | sed -e &#x27;s/[^[:alnum:]]/-/g&#x27; | tr -s &#x27;-&#x27; | tr A-Z a-z)</span>&quot;</span>
  NEW_POST_FILE=<span class=hljs-variable>$JEKYLL_POSTS</span>/$(<span class=hljs-built_in>date</span> +%Y-%m-%d-<span class=hljs-variable>$SLUGIFIED</span>.md)

  <span class=hljs-built_in>cat</span> &lt;&lt;<span class=hljs-string>frontmatter &gt; $NEW_POST_FILE
---
layout: post-minimal
title: &quot;$TITLE&quot;
image: &#x27;&#x27;
comments: false
categories:
summary: &quot;&quot;
---
frontmatter</span>

  <span class=hljs-built_in>echo</span> <span class=hljs-string>&quot;New post created, opening in Atom, starting Jekyll&quot;</span>
  atom <span class=hljs-variable>$NEW_POST_FILE</span>
  jekyll serve -s <span class=hljs-variable>$JEKYLL_ROOT</span>
}
</code></pre>
', 'Core Skills', 30, 1296, '208251722', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/208251722/29e1af27e1', '2023-03-19 09:49:30.172-07', '2023-03-19 09:49:30.172-07', 'I use the static site generator Jekyll to write my blog. I store the site at Github, who then translates and hosts it all for me for free. Jekyll is simple to use and I like it a lot. There''s only one problem: it''s a bit manual.

Every post that you create has to have a very specific filename in the form of year-month-day-post-slug.md. Not that big of a problem, just a mere annoyance. In addition, every post you have must have a blob of text at the top called the front matter. Again: not a huge problem, just kind of time consuming. The perfect candidate for a little help from a shell script.

```sh
#!/bin/bash
# a Jekyll post creator, which creates a new file, adds frontmatter,
# and opens the editor and starts Jekyll
new_post() {
  JEKYLL_ROOT=~/Documents/Sites/conery-io-jekyll
  JEKYLL_POSTS=$JEKYLL_ROOT/_posts
  TITLE=$1
  SLUGIFIED=$(echo -n $TITLE | sed -e ''s/[^[:alnum:]]/-/g'' | tr -s ''-'' | tr A-Z a-z)
  NEW_POST_FILE=$JEKYLL_POSTS/$(date +%Y-%m-%d-$SLUGIFIED.md)

  cat <<frontmatter > $NEW_POST_FILE
---
-minimal
title: $TITLE
image: ''''
comments: false
categories:
summary: 
---
frontmatter

  echo New post created, opening in Atom, starting Jekyll
  atom $NEW_POST_FILE
  jekyll serve -s $JEKYLL_ROOT
}
```
', NULL),
(32, 1, 'Deciphering a Complex Bash Script', 'deciphering-a-complex-bash-script', 'f', 'I use the static site generator Jekyll to write my blog. I store the site at Github, who then translates and hosts it all for me for free. Jekyll is simple to use and I like it a lot. There''s only one problem: it''s a bit manual.', '<p>This is a bonus video that&#39;s not covered in the book as it&#39;s quite visual and somewhat interactive. In short: one of the best ways to learn any kind of programming language is to read what others have done and then try to understand what&#39;s going on.</p>
<p>Throughout these videos I&#39;ve been talking about Oh My Zsh! from Robby Russel. Installing it is simple, but it involves executing a remote shell script downloaded from the internet! Never a good idea. You should be able to read these scripts so you know what&#39;s going on, and that your machine won&#39;t be compromised in some way.</p>
<p>That&#39;s what we&#39;ll do in this video.</p>
<h2 id=the-code>The Code</h2>
<p>You can follow along and read the code by <a href=https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh>heading over to the Oh My Zsh! repo</a>. It&#39;s possible that the script might change between the recording date and now, so some patience might be required.</p>
', 'Core Skills', 31, 1474, '207361238', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/207361238/1cdc822582', '2023-03-19 09:49:30.173057-07', '2023-03-19 09:49:30.173057-07', 'This is a bonus video that''s not covered in the book as it''s quite visual and somewhat interactive. In short: one of the best ways to learn any kind of programming language is to read what others have done and then try to understand what''s going on.

Throughout these videos I''ve been talking about Oh My Zsh! from Robby Russel. Installing it is simple, but it involves executing a remote shell script downloaded from the internet! Never a good idea. You should be able to read these scripts so you know what''s going on, and that your machine won''t be compromised in some way.

That''s what we''ll do in this video.

## The Code

You can follow along and read the code by [heading over to the Oh My Zsh! repo](https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh). It''s possible that the script might change between the recording date and now, so some patience might be required.
', NULL),
(33, 1, 'Making Your Life Easier with Make', 'making-your-life-easier-with-make', 't', 'Make is a build utility that works with a file called a Makefile and basic shell scripts. It can be used to orchestrate the output of any project that requires a build phase. It''s part of Linux and it''s easy to use.', '<p>It&#39;s important to understand that the utility, make, is not a compiler as many people believe. It&#39;s a build tool just like MSBuild or Ant.</p>
<p>Make is an extraordinarily simple tool which, combined with the power of the shell, can greatly reduce the complexity of your application&#39;s build needs. Even if you&#39;re a Gulp/Grunt/Whatever fan, you should understand the power of make, as well as its shortcomings.</p>
<h2 id=the-basics>The Basics</h2>
<p>Make will turn one (or more) files into another file. That&#39;s the whole purpose of the tool. If you run make and your source hasn&#39;t changed, make won&#39;t build your output.</p>
<p>Make runs on shell commands, orchestrated using the concept of &quot;targets&quot;.</p>
<h2 id=the-code>The Code</h2>
<p>You can follow along and read the code by <a href=https://github.com/imposters-handbook/videos/tree/master/make>using the code in this commit</a>. </p>
', 'Core Skills', 32, 1631, '208250932', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/208250932/a87c258483', '2023-03-19 09:49:30.173953-07', '2023-03-19 09:49:30.173953-07', 'It''s important to understand that the utility, make, is not a compiler as many people believe. It''s a build tool just like MSBuild or Ant.

Make is an extraordinarily simple tool which, combined with the power of the shell, can greatly reduce the complexity of your application''s build needs. Even if you''re a Gulp/Grunt/Whatever fan, you should understand the power of make, as well as its shortcomings.

## The Basics

Make will turn one (or more) files into another file. That''s the whole purpose of the tool. If you run make and your source hasn''t changed, make won''t build your output.

Make runs on shell commands, orchestrated using the concept of targets.

## The Code

You can follow along and read the code by [using the code in this commit](https://github.com/imposters-handbook/videos/tree/master/make). 
', NULL),
(34, 1, 'Using Make to Improve Your Test Suite', 'using-make-to-improve-your-test-suite', 'f', 'No video with this one - just a post with lots of code. Make has been around forever and is often overlooked in favor of tools that recreate precisely what it does, but in crappier ways. Let''s see how you can use Make to help your testing process.', '<p>I&#39;m a giant Make fan to the point where I&#39;ve been accused of abusing it. It&#39;s an incredibly useful tool and, when used with care, can <strong>replace a mountain of cruft and nonsense</strong> in your projects.</p>
<p>Let&#39;s see how you can use Make to help you build your database as well as clean and reset your test database before each test run.</p>
<h2 id=setting-up-your-database-scripts>Setting Up Your Database Scripts</h2>
<p>I know people dig migrations, which is fine as it gives you a versioned way of working with data. Hopefully you&#39;ll see that there&#39;s a simple way to use them with this strategy as we go on. For now I&#39;m going to do a super simple first step and discuss changes later on (better options if you ask me). I&#39;ll be using <strong>PostgreSQL</strong> running locally (surprise!) and <strong>NodeJS</strong> for these samples.</p>
<h3 id=create-a-scripts-directory>Create a Scripts Directory</h3>
<p>We&#39;re going to create a SQL script that will run before each test, so let&#39;s pop that in a <code>/scripts</code> directory to keep things clean. Let&#39;s start out by cleaning everything in the database with our build script:</p>
<pre><code>    --drop everything... bye bye
    drop schema <span class=hljs-keyword>if</span> exists public cascade;
    
    --recreate
    create schema public;
</code></pre>
<p><strong>Careful now</strong>! Be sure there&#39;s nothing in your Postgres db before before running this script! Dropping the public schema with <code>cascade</code> is scorched earth and will drop all extensions, tables, views - <em>everything</em>. Using the <code>cascade</code> flag tells Postgres to drop all objects in order as well, so you don&#39;t need to worry about integrity problems. In a brand new database this isn&#39;t all that bad but in an existing one... ouch.</p>
<p>Let&#39;s run this to be sure it works. I&#39;ll create a Postgres database called <code>shadetree</code> which will be our test db and then run this script using <code>psql</code>, the Postgres CLI:</p>
<pre><code>    createdb shadetree
    psql shadetree &lt; scripts/db.<span class=hljs-property>sql</span>
</code></pre>
<p>You should see absolutely nothing, which is bash telling you everything&#39;s fine :). </p>
<h2 id=creating-the-makefile>Creating the Makefile</h2>
<p>Now let&#39;s create our Makefile. Make is a build utility that works with a file called a Makefile and basic shell scripts. It can be used to orchestrate the output of any project that requires a build phase. It’s part of Linux and it’s easy to use.</p>
<p>The power of Make comes with it&#39;s super simple orchestration. We&#39;ll see that in a minute, for now let&#39;s hook up our command. Create your Makefile using <code>touch Makefile</code> or File &gt; New in your favorite editor. Keep it in your project root and add this:</p>
<pre><code><span class=hljs-attr>db</span>:
    psql shadetree &lt; ./scripts/db.<span class=hljs-property>sql</span>
</code></pre>
<p>That&#39;s it! We create our &quot;target&quot; (the <code>db</code> thing with a colon) and our &quot;action&quot; (or &quot;command&quot;) is the second part, which is the script we ran before. This isn&#39;t strictly bash - it just looks a lot like it. I&#39;m not going to get into that here (it&#39;s a bit detailed) but there&#39;s a lot more we can do to standardize this Makefile with variables and shorthand... for the sake of staying on target (ha ha get it!) let&#39;s keep going.</p>
<p>The whole structure - the target, action, etc - is called a <em>rule</em>. This Makefile contains the rules for building our app.</p>
<p>Let&#39;s run and see what happens:</p>
<pre><code>make db
psql shadetree &lt; ./scripts/db.<span class=hljs-property>sql</span>
<span class=hljs-variable constant_>DROP</span> <span class=hljs-variable constant_>SCHEMA</span>
<span class=hljs-variable constant_>CREATE</span> <span class=hljs-variable constant_>SCHEMA</span>
</code></pre>
<h3 id=executing-the-makefile>Executing the Makefile</h3>
<p>To run a Makefile just use the <code>make</code> command in the same directory as your Makefile. You pass in the target you want to run and it will execute. You can see each command and its output as its executed.</p>
<p>Since we only have a single rule, we could also just run <code>make</code> without any arguments and the same thing will happen. By convention, the first rule in a Makefile will be executed if you don&#39;t specify your target during execution.</p>
<h2 id=creating-our-tests>Creating Our Tests</h2>
<p>I&#39;m using Node and for testing I&#39;ll use my favorite test tool: <a href=https://mochajs.org/>Mocha.js</a>. Let&#39;s quickly set that up - if you don&#39;t know what you&#39;re seeing have a Google to get familiar:</p>
<pre><code>mkdir test
mkdir test/user_test.<span class=hljs-property>js</span>
</code></pre>
<p>This is a pretty standard way of setting up Mocha in a project but if you don&#39;t use Mocha that&#39;s fine - pretend we&#39;re using your favorite library.</p>
<p>OK, let&#39;s fast-forward a bit and pretend I have created some tests for my <code>users</code> and I want to run them. Let&#39;s put this all together and see how we can build our database and test suite in harmony.</p>
<h2 id=putting-it-all-together>Putting It All Together</h2>
<p>We could just use JSONB to save a document, but we want to get relational! We&#39;ll be working with <code>users</code> so let&#39;s crack open our <code>/scripts/db.sql</code> file and define what a user looks like together with some <code>roles</code>: </p>
<pre><code>--drop everything... bye bye
drop schema <span class=hljs-keyword>if</span> exists public cascade;

--recreate
create schema public;

create table <span class=hljs-title function_>users</span>(
  id bigserial primary key,
  name text,
  email text not <span class=hljs-literal>null</span> unique,
  profile jsonb,
  created_at timestamp not <span class=hljs-literal>null</span> <span class=hljs-keyword>default</span> <span class=hljs-title function_>now</span>()
);

create table <span class=hljs-title function_>roles</span>(
  id serial primary key,
  name text not <span class=hljs-literal>null</span>,
  privilege int not <span class=hljs-literal>null</span> <span class=hljs-keyword>default</span> <span class=hljs-number>0</span>
);

create table <span class=hljs-title function_>users_roles</span>(
  role_id int not <span class=hljs-literal>null</span> references <span class=hljs-title function_>roles</span>(id),
  user_id bigint not <span class=hljs-literal>null</span> references <span class=hljs-title function_>users</span>(id),
  primary key (user_id, role_id)
);

--<span class=hljs-keyword>let</span><span class=hljs-string>&#x27;s add some test data
insert into roles(name, privilege) values(&#x27;</span><span class=hljs-title class_>Admin</span><span class=hljs-string>&#x27;,99);
insert into roles(name, privilege) values(&#x27;</span><span class=hljs-title class_>User</span><span class=hljs-string>&#x27;,10);

insert into users(name, email) values(&#x27;</span><span class=hljs-title class_>Admin</span> <span class=hljs-title class_>Kim</span><span class=hljs-string>&#x27;,&#x27;</span>admin@test.<span class=hljs-property>com</span><span class=hljs-string>&#x27;);
insert into users(name, email) values(&#x27;</span><span class=hljs-title class_>Test</span> <span class=hljs-title class_>Jones</span><span class=hljs-string>&#x27;,&#x27;</span>test@test.<span class=hljs-property>com</span><span class=hljs-string>&#x27;);

insert into users_roles(role_id, user_id) values (1, 1);
insert into users_roles(role_id, user_id) values (2, 2);</span>
</code></pre>
<h3 id=definition-for-users-and-roles>Definition for users and roles</h3>
<p>Right here is why I <em>love</em> working with SQL. I can do so much to protect my data that saves quite a few lines of validation code and tests. For instance: the <code>unique</code> constraint on <code>email</code>, the composite primary key on my many to many join table and the <code>bigint</code> (int64) on my users as a primary key. </p>
<p>You&#39;ll also notice that I&#39;ve added some test data in here for use with my tests. Yes yes I could do this in <code>setup</code> but that&#39;s extra code! This is a bit easier don&#39;t you think?</p>
<p>We can run this script using <code>make</code>:</p>
<pre><code>make
psql shadetree &lt; ./scripts/db.<span class=hljs-property>sql</span>
<span class=hljs-attr>NOTICE</span>:  drop cascades to <span class=hljs-number>3</span> other objects
<span class=hljs-attr>DETAIL</span>:  drop cascades to table users
drop cascades to table roles
drop cascades to table users_roles
<span class=hljs-variable constant_>DROP</span> <span class=hljs-variable constant_>SCHEMA</span>
<span class=hljs-variable constant_>CREATE</span> <span class=hljs-variable constant_>SCHEMA</span>
<span class=hljs-variable constant_>CREATE</span> <span class=hljs-variable constant_>TABLE</span>
<span class=hljs-variable constant_>CREATE</span> <span class=hljs-variable constant_>TABLE</span>
<span class=hljs-variable constant_>CREATE</span> <span class=hljs-variable constant_>TABLE</span>
<span class=hljs-variable constant_>INSERT</span> <span class=hljs-number>0</span> <span class=hljs-number>1</span>
<span class=hljs-variable constant_>INSERT</span> <span class=hljs-number>0</span> <span class=hljs-number>1</span>
<span class=hljs-variable constant_>INSERT</span> <span class=hljs-number>0</span> <span class=hljs-number>1</span>
<span class=hljs-variable constant_>INSERT</span> <span class=hljs-number>0</span> <span class=hljs-number>1</span>
<span class=hljs-variable constant_>INSERT</span> <span class=hljs-number>0</span> <span class=hljs-number>1</span>
<span class=hljs-variable constant_>INSERT</span> <span class=hljs-number>0</span> <span class=hljs-number>1</span>
</code></pre>
<p><em>Hooorah</em>! Nice clean database with test data planted. The only thing I don&#39;t care for is the chatter - I don&#39;t want to see this every time I run my tests and I can fix that quickly:</p>
<pre><code><span class=hljs-attr>db</span>:
    @psql shadetree &lt; ./scripts/db.<span class=hljs-property>sql</span> -q
</code></pre>
<p>Here I&#39;ve updated my Makefile to 1) silence the action output using <code>@</code> prepended to the command and 2) tell <code>psql</code> I don&#39;t want to see the results using the <code>-q</code> flag (quiet mode).</p>
<p>Now let&#39;s wire up our tests with another command:</p>
<pre><code><span class=hljs-attr>test</span>: db
    mocha

<span class=hljs-attr>db</span>:
    @psql shadetree &lt; ./scripts/db.<span class=hljs-property>sql</span> -q
</code></pre>
<p>I&#39;ve created a new target called <code>test</code> but this time I&#39;ve specified a <em>dependency</em> that must run to completion before the target executes. You do that by specifying a target name just to the right of the initial target as you see. Now my <code>db</code> target will run first and off we go.</p>
<p>But there&#39;s a bit more we have to do before we&#39;re done.</p>
<h3 id=phony-commands>Phony Commands</h3>
<p>Make is used to compile code, that&#39;s its primary use case. This can be a lengthy process so before each target is run, Make will check and see if the output exists and if it has been updated. If it hasn&#39;t, Make will skip the entire rule. You can override this check by specifying that a rule is &quot;phony&quot;:</p>
<pre><code>.<span class=hljs-property>PHONY</span>: test db
</code></pre>
<p>The last line of our Makefile</p>
<h3 id=cleaning-up>Cleaning Up</h3>
<p>We also want to be sure we can clean things up if things go wrong, which they just might. When compiling software, you typically want to start from a clean state if there&#39;s an error - same goes for what we&#39;re trying to do. By convention, every Makefile should have a <code>clean</code> rule (some people call this <code>rollback</code> - it&#39;s up to you). </p>
<p>We can add this quickly, which brings our rounded out Makefile to a solid state:</p>
<pre><code><span class=hljs-attr>test</span>:	db
    mocha

<span class=hljs-attr>db</span>:
    @psql shadetree &lt; ./scripts/db.<span class=hljs-property>sql</span> -q

<span class=hljs-attr>clean</span>:
    psql shadetree -c <span class=hljs-string>&quot;drop schema if exists public cascade; create schema public;&quot;</span> -q

.<span class=hljs-property>PHONY</span>: test db
</code></pre>
<p>To run this properly we can execute a simple command:</p>
<pre><code>make || make clean
</code></pre>
<p>If a rule returns an error Make will stop running and return an error back to the shell. We can capture that and clean things up with an &quot;or&quot; - <code>||</code> - if anything fails, clean it up!</p>
<p>We can now build our database and add test data before each test run, stopping everything if we have a problem. Yay!</p>
<h3 id=going-a-bit-further>Going a Bit Further</h3>
<p>If you&#39;re a <code>zsh</code> user (which I hope you are) and use <a href=https://ohmyz.sh/>Oh My Zsh</a>! (which I hope you do!) make sure you have the dotenv plugin active. This will load a <code>.env</code> file automatically if it&#39;s present in a given directory.</p>
<p>We can use this to make executing our test suite a little easier on the fingers:</p>
<pre><code>alias mt=<span class=hljs-string>&quot;make || make clean&quot;</span>
</code></pre>
<p>Our .env file, loaded into our shell using the dotenv plugin<br>Now we&#39;re jam slammin!</p>
<h2 id=handling-changes>Handling Changes</h2>
<p>This approach works great for getting things off the ground - but what about handling changes as the project matures? This is where migrations can be helpful - but then again they can also cause some serious headaches too. I&#39;ll sidestep the discussion on migrations - I don&#39;t particularly care for them since I&#39;m a SQL fan - but if you like them that&#39;s OK ... I&#39;m not judging...</p>
<h3 id=go-ahead-migrate>Go Ahead, Migrate!</h3>
<p>You can create rule to run your migrations before each test if you like instead of executing an entire SQL file. It&#39;ll work just the same as long as your migration tool has a CLI component - just call it from your Make rule.</p>
<p>Me? I like change scripts.</p>
<h3 id=change-scripts>Change Scripts</h3>
<p>Once you&#39;re deployed, feel free to wipe out the <code>./scripts/db.sql</code> file. Don&#39;t delete it - just remove the code! It will hopefully be versioned (and tagged properly) in Git, which is where it belongs. </p>
<p>Moving forward, this file will contain your <code>alter table</code> scripts or, more likely, the SQL you need for your next iteration. The trick here is resetting your database to the state it was in prior to executing your change script which, thankfully, is pretty easy using <code>pg_dump</code>.</p>
<p>The entire command you want is <code>pg_dump -d shadetree &gt; ./scripts/reset.sql</code>. This command will generate a SQL file that will create your database for you. There are a few options you can send in if you need - use <code>--help</code> if you want to see them all. </p>
<p>Now that you have your reset script, just run it prior to your change script:</p>
<pre><code><span class=hljs-attr>test</span>:	db
    mocha

<span class=hljs-attr>db</span>: clean reset_db
    @psql shadetree &lt; ./scripts/db.<span class=hljs-property>sql</span> -q

<span class=hljs-attr>reset_db</span>:
    @psql shadetree &lt; ./scripts/reset.<span class=hljs-property>sql</span> -q

<span class=hljs-attr>clean</span>:
    psql shadetree -c <span class=hljs-string>&quot;drop schema if exists public cascade; create schema public;&quot;</span> -q

.<span class=hljs-property>PHONY</span>: test db reset_db clean
</code></pre>
<p>Notice that I now have two dependencies for my <code>db</code> rule: <code>clean</code> and <code>reset_db</code>. They&#39;re executed in order - you just need to separate them with tabs!</p>
<p>Now you can build out your change script as you need and when you deploy, erase it and let Git do its job versioning your database with <code>reset.sql</code> and <code>db.sql</code>.</p>
<h2 id=summary-and-some-caveats>Summary and Some Caveats</h2>
<p>Using a few simple lines in a Makefile and 30 or so lines of SQL, we&#39;ve replaced the need for quite a few external dependencies. Database cleaners, for one and ORM validators with tests to be sure things work as we want. I know it&#39;s not for everyone, but I find it very helpful.</p>
<p>Now for the caveats! If you&#39;re a Make fan you might be cringing right now at my lack of convention and hard-coded names in place of variables. This is a conscious decision on my part as the point of this whole post was how to automate database clean &amp; build with testing.</p>
<p>If you want to see what those conventions look like together with a &quot;clean&quot; Makefile you can <strong>hit the subscribe button above and support my efforts</strong> :).</p>
', 'Core Skills', 33, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.175503-07', '2023-03-19 09:49:30.175503-07', NULL, NULL);
INSERT INTO public.lessons (id, course_id, title, slug, free, summary, description, category, index, duration, vimeo_id, youtube_id, github, fa_icon, mdi_icon, download_url, created_at, updated_at, markdown, gist) VALUES
(35, 11, 'Review: Big-O Notation', 'big-o-notation', 't', 'It''s a thing you''ll need to know if you plan to get through any interview. It''s actually quite useful and in this post I''ll hopefully make the case that''s it''s simple as well.', '<p><em>No video for this one - just a quick review of Big-O</em>.</p>
<p>When I started writing <strong><a href=https://bigmachine.io/products/the-imposters-handbook/>The Imposter’s Handbook</a></strong>, this was the question that was in my head from the start: <strong>what the f</strong> is Big O and why should I care?I remember giving myself a few weeks to jump in and figure it out but, fortunately, I found that it was pretty straightforward after putting a few smaller concepts together.</p>
<p><strong>Big O is conceptual</strong>. Many people want to qualify the efficiency of an algorithm based on the number of inputs. A common thought is <em>if I have a list with 1 item it can’t be O(n) because there’s only 1 item so it’s O(1)</em>. This is an understandable approach, but <strong>Big O is a technical adjective</strong>, it’s not a benchmarking system. It’s simply using math to describe the efficiency of what you’ve created.</p>
<p><strong>Big O is worst-case</strong>, always. That means that even if you think you’re looking for is the very first thing in the set, Big O doesn’t care, a loop-based find is still considered O(<em>n</em>). That’s because Big O is just a descriptive way of thinking about the code you’ve written, not the inputs expected.</p>
<h2 id=an-amazingly-useful-concept>An Amazingly Useful Concept</h2>
<p>I’m glad I took the time to learn Big O because <strong>I find myself thinking about it  often</strong>. If you’ve always wondered about Big O but found the descriptions a bit too academic, I’ve put together a bit of a <strong>Common Person’s Big O Cheat Sheet,</strong> along with how you might use Big O in your every day work.</p>
<p>Rather than base this on arrays and simplified nonsense, I’ll share with you a situation that I was in just a year ago: <strong>choosing the right data structure in Redis.</strong> If you’ve never used Redis before, it’s a very basic key-value store that works in-memory and can optionally persist your data to disk.</p>
<p>When you work in a relational database like PostgreSQL, MySQL, or SQL Server you get a single data structure: <strong>the table</strong>. Yes, there are data <strong>types</strong>, sure, but your data is stored in a row separated by columns, which is a data <strong>structure</strong>.</p>
<p>Redis gives you a bit more flexibility. You get to choose the data structure that fits your programming need the best. There are a bunch of them, but the ones I find myself using most often are:</p>
<ul>
<li><strong>String.</strong> With this structure you store a string value (which could be JSON) with a single key.</li>
<li><strong>Set.</strong> A Set in Redis is a bunch of unordered, unique string values.</li>
<li><strong>Sorted Set</strong>. Just like a Set, but sorted.</li>
<li><strong>List</strong>. Non-unique string values sorted <strong>by order of insertion</strong>. These things operate like both stacks and queues.</li>
<li><strong>Hash</strong>. A set of string values identified by “sub keys”. You can think of this as a JSON object with values being only strings.</li>
</ul>
<p><strong>Why are we talking about Redis when this post is about Big O</strong>? Because <em>Redis and Big O go hand in hand</em>. To choose the right data structure for your needs, you need to dig you some Big O (whether you know it’s Big O or not).</p>
<h2 id=finding-something-in-a-shopping-cart>FINDING SOMETHING IN A SHOPPING CART</h2>
<p>Let’s say you’re tasked with storing Shopping Cart data in Redis. Your team has decided that an in-memory system would work well because it’s fast and it doesn’t matter if cart data is lost if the server blows up.</p>
<p>The question is: <strong>how do you store this information?</strong> Here’s what’s required:</p>
<ul>
<li>Finding the cart quickly by key</li>
<li>CRUD operations on each item within the cart</li>
<li>Finding an item in the cart quickly</li>
<li>Iterating over each item in the cart</li>
</ul>
<p>Believe it or not, <strong>you’re thinking in Big O right now</strong> and you might not even know it. I used the words “quickly” and “iterate” above, which may or may not mean something to you in a technical sense. The thing I was trying to convey by using the word “quickly” is that I want to get to the cart (or an item within it) <strong>directly</strong>, without having to jump through a lot of hoops.</p>
<p>Even that description is really arm-wavy, isn’t it? We can dispose of the arm-waving by <strong>thinking about things in terms of operations per input</strong>. How many operations does my code need to perform to get to a single cart from the set of all carts in Redis?</p>
<h2 id=only-one-operation-o1>ONLY ONE OPERATION: <em>O(1)</em></h2>
<p>The cool thing about Redis is that it’s a key-value store. To find something, you just need to know its key. You don’t have to run a loop or do some complex find routine – it’s just right there for you.</p>
<p>When something requires only one operation we can say that directly: <strong>my code for finding a shopping cart is on the order of 1 operation</strong>. If we want to be Big O about it, <strong>we can say it’s order 1, or “O(1)”</strong>. It doesn’t matter how many carts are in our Redis database either! We have a key and we can go right to it.</p>
<p>A more precise way to think about this is to use the term “constant time”. It doesn’t matter how many rows of data are in our database (or, correspondingly, how many inputs to our algorithm) – the algorithm will run in <strong>constant time</strong> which doesn’t change.</p>
<p>What about the items in the cart itself?</p>
<h2 id=looping-over-a-set-on>LOOPING OVER A SET: O(<em>N</em>)</h2>
<p>We know that our cart will need to store 0 to <em>n</em> items. I’m using <em>n</em> here because I don’t know how many items that will be – it varies per customer.</p>
<p>I can use <strong>any</strong> of Redis’s data structures for this:</p>
<ul>
<li>I can store a JSON blob in a String, identified by a unique cart key</li>
<li>I can store items in a Set or Sorted Set, with each item being a bit of JSON that represents a <code>CartItem</code></li>
<li>I can store things in a List in the same way as a set</li>
<li>I can store things in a Hash, with each item having a unique sub key</li>
</ul>
<p>When it comes to items in the cart, we need to be able to do CRUD stuff but we also need to be able to find an item in the cart “as quickly as possible”. If we use a String (serializing it into JSON first), a Set or a List we’ll need to loop over every item in a cart in order to find the one we’re looking for.</p>
<p>Rather than saying “need to loop over every item”, we can think about things in terms of operations again: <strong>if I use a Set or a List or a String I’ll need to have one operation for every n items in my cart</strong>. We can also say that this is “order <em>n</em>“, or just O(<em>n</em>).</p>
<p>You can spot O(<em>n</em>) operations easily by simply looking for loops in your code. This is my rule of thumb: “if there’s a loop, it’s O(<em>n</em>)”.</p>
<h2 id=looping-within-a-loop-on2>LOOPING WITHIN A LOOP: O(<em>N^2</em>)</h2>
<p>Let’s say we decided to keep things simple and deal with problems as they arise so we chose a Set, allowing us to dump unique blobs of JSON data that we can loop over if we need to. Unfortunately for us, this caused some issues:</p>
<p><img src=/assets/img/posts/screenshot_57.jpg alt=></p>
<p>By changing the <code>quantity</code> in our <code>CartItem</code> we have made our JSON string unique, causing duplication. We need to remove these duplications now, otherwise our customers won’t be happy.</p>
<p>Simple enough to do: we just loop over the items within a cart, and then loop over the items one more time (skipping the current loop index) to see if there’s a match on <code>sku</code>. This is a classic <strong>brute force</strong> algorithm for deduping an array. That’s a lot of words to describe this nested loop algorithm and we can do better if we use Big O.</p>
<p>Thinking in terms of operations, we have <em>n</em> operations per <em>n</em> items in our cart. That’s <code>n * n</code> operations, which we can shorthand to “order <em>n</em> squared” or O(<em>n</em>^2). Put another way: <strong>deduping an array is an O(n^2) operation, which isn’t terribly efficient</strong>.</p>
<p>As I said before, I like to think of these things in terms of loops. My rule of thumb here is that if <strong>I have to use a loop within a loop, that’s O(<em>n^2</em>)</strong>. Another rule of thumb is that the term “brute force” almost always denotes an O(<em>n^2</em>) algorithm that uses some kind of nested loop.</p>
<h2 id=indexing-a-database-table-and-olog-n>INDEXING A DATABASE TABLE AND O(<em>LOG N</em>).</h2>
<p>If you’ve ever worked on a larger project with a DBA, you’ve probably been barked at for querying a table without utilizing an index (a “fuzzy” search, for instance). Have you ever wondered what the deal is? I have. I <em>was</em> that DBA doing the barking!</p>
<p>Here’s the thing: tables tend to grow over time. Let’s say that our commerce site is selling independent digital films and our catalog is constantly growing. We might have a table called <code>film</code> filled with ridiculous test data that we want to query based on <code>title</code>. Unfortunately, we don’t have an index just yet and our query is beginning to slow down. We decide to ask PostgreSQL what’s going on using <code>EXPLAIN</code> and <code>ANALYZE</code>:</p>
<p><img src=/assets/img/posts/screenshot_58.jpg alt=></p>
<p>Our database is doing what’s called a “Sequential Scan”. In SQL Server land this is called a “Full Table Scan” and it basically means that Postgres has to loop over every row, comparing the <code>title</code> to our query argument.</p>
<p>In other words: a Sequential Scan is a loop over every item which means it’s O(<em>n</em>), where <em>n</em> represents the number of rows in our table. As our table grows, the efficiency of this algorithm goes down linearly.</p>
<p>It’s easy to improve the performance here by adding an index:</p>
<p><img src=/assets/img/posts/screenshot_59.jpg alt=></p>
<p>Now we’re using an <strong>Index Scan</strong>, which is, I suppose, much faster. But how much? And how does it work?</p>
<p>Under the covers, most databases use a version of an algorithm called <strong>binary search</strong> – <a href=https://bigmachine.io/products/the-imposters-handbook/>I made a video</a> about this and other algorithms which you can <a href=https://bigmachine.io/products/the-imposters-handbook/>watch right here</a> if you want. For binary search to work properly, you have to sort the list of things you’re working with. That’s exactly what Postgres does when you first create the index:</p>
<p><img src=/assets/img/posts/screenshot_61.jpg alt=></p>
<p>Now that the index is sorted, Postgres can find the <code>title</code> we’re looking for by systematically splitting this list in half until there’s only one row left, which will be the one we want.</p>
<p>This is much better than looping over every row (which we know is O(<em>n</em>)), but how many operations do we have here? For this we can use <strong>logarithms:</strong></p>
<p><img src=/assets/img/posts/screenshot_62.jpg alt=></p>
<p>We’re continually splitting things in half in a sorted set until we arrive at the thing we want. We can describe this with an inverted binary tree, as you see above. We start with 8 values, split, and are left with 4, which we split again to get 2, then finally 1.</p>
<p>This is an inverse squaring operation as we’re going from 2^3 (8) down to 2^2 (4) down to 2^1 (2) and finally 2^0 (1). Inverse squaring operations are called <strong>logarithms</strong>. That means that we can now describe the operations of our database index as “being logarithmic”. We should also specify “logarithmic of <strong>what</strong>” to which we can answer “we don’t know, so we’ll say it’s <em>n</em>“, also known as O(<em>log n</em>).</p>
<p>This kind of algorithm is called “divide and conquer” and when you see those words, you know immediately that you’re talking about a <em>log n</em> algorithm.</p>
<h2 id=-and-so-what>… AND SO WHAT?</h2>
<p>Here’s why you care about turning something that’s O(<em>n</em>) into O(<em>log n</em>) and the best part is that it’s not really arguable <em>because it’s math</em> (I was told that means you’re always right :trollface:).</p>
<p>Let’s say we have 1000 records in our <code>film</code> table. To find “Academy Dinosaur” our database will need to do 1000 operations (comparing the <code>title</code> in each row). But how many will it do if we use an index? Let’s use a calculator and find out, shall we? I need to find the log base 2 (because of the binary split) of 1000:</p>
<p><img src=/assets/img/posts/screenshot_63.jpg alt=></p>
<p>Only Ten! Ten splits of 1000 records to find what we want in our database. That’s a performance gain of a few orders of magnitude, and it’s a lot more convincing to tell someone <strong>that</strong> as opposed to “it’s a lot faster”.</p>
<p>The best part here is that we can keep using this calculator to find out how many operations will be needed if we have a <strong>million</strong> records (it’s 20) or a <strong>billion</strong> (it’s 30). That kind of scaling as our inputs goes up is the stuff of DBA dreams.</p>
<h2 id=bonus-question-whats-the-big-o-of-a-primary-key-lookup>BONUS QUESTION: WHAT’S THE BIG O OF A PRIMARY KEY LOOKUP?</h2>
<p>It’s tempting to think that if I have a primary key and I know the value of that key that I <strong>should</strong> be able to simply go right to it. Is that what happens? Think about it for a second and while you’re thinking let’s talk about Redis a bit more.</p>
<p>A major selling point of Redis (or any key-value system really) is that you can do a <strong>lot</strong> of stuff with O(1) <strong>time complexity</strong>. That’s what we’re measuring when we talk about Big O – <strong>time complexity</strong>, or long something takes given the inputs to an algorithm you’re working with. There’s also <strong>space complexity</strong> which has to do with the resources your algorithm needs, but I’ll save that for another post.</p>
<p>Redis is a key-value store, which means that if you have a key, you have an O(1) operation. For our Shopping Cart above, if I use a Hash I’ll have a key for the cart <strong>as well as</strong> a key for each item in the cart, which is huge in terms of performance – or I should say “optimal time complexity”. We can access any item in a cart without a single loop, which makes things fast. Super fast.</p>
<p>OK, back to the question regarding primary key queries: are they O(1)? <strong>Nope</strong>:</p>
<p><img src=/assets/img/posts/screenshot_64.jpg alt=></p>
<p>Indexes in most database systems tend to use a variation of binary search, and primary key indexes are <strong>no different</strong>. That said, there are plenty of optimizations that databases use under the covers to make these queries extremely fast.</p>
<p>I should also note that some databases, like Postgres, offer you different types of indexes. For instance you can use a Hash Index with Postgres that will give you O(1) access to a given record. There is a lot going on behind the scenes, however, to the point where <a href=https://dba.stackexchange.com/questions/212685/how-is-it-possible-for-hash-index-not-to-be-faster-than-btree-for-equality-looku>there’s a pretty good debate</a> about whether they’re actually faster. I’ll side step this discussion and you can go read more for yourself.</p>
<h2 id=there-you-have-it>THERE YOU HAVE IT</h2>
<p>I find myself thinking about things in terms of Big O a lot. The cart example, above, happened to me just over a month ago and I needed to make sure that I was flexing the power of Redis as much as possible.</p>
<p>I don’t want to turn this into a Redis commercial, but I will say that it (and systems like it) have a lot to offer when you start thinking about things in terms of <strong>time complexity</strong>, which you should! <strong>It’s not premature optimization to think about Big O upfront, it’s programming</strong> and I don’t mean to sound snotty about that! If you can clip an O(<em>n</em>) operation down to O(<em>log n</em>) then you should, don’t you think?</p>
<p>So, quick review:</p>
<ul>
<li>Plucking an item from a list using an index or a key: O(1)</li>
<li>Looping over a set of <em>n</em> items: O(<em>n</em>)</li>
<li>A nested loop over <em>n</em> items: O(<strong>n^2</strong>)</li>
<li>A divide and conquer algorithm: O(<strong>log n</strong>)</li>
</ul>
', 'Review', 0, 0, '', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-03-19 09:49:30.206985-07', '2023-03-19 09:49:30.206985-07', '_No video for this one - just a quick review of Big-O_.

When I started writing **[The Imposter’s Handbook](https://bigmachine.io/products/the-imposters-handbook/)**, this was the question that was in my head from the start: **what the f** is Big O and why should I care?I remember giving myself a few weeks to jump in and figure it out but, fortunately, I found that it was pretty straightforward after putting a few smaller concepts together.

**Big O is conceptual**. Many people want to qualify the efficiency of an algorithm based on the number of inputs. A common thought is *if I have a list with 1 item it can’t be O(n) because there’s only 1 item so it’s O(1)*. This is an understandable approach, but **Big O is a technical adjective**, it’s not a benchmarking system. It’s simply using math to describe the efficiency of what you’ve created.

**Big O is worst-case**, always. That means that even if you think you’re looking for is the very first thing in the set, Big O doesn’t care, a loop-based find is still considered O(*n*). That’s because Big O is just a descriptive way of thinking about the code you’ve written, not the inputs expected.

## An Amazingly Useful Concept

I’m glad I took the time to learn Big O because **I find myself thinking about it  often**. If you’ve always wondered about Big O but found the descriptions a bit too academic, I’ve put together a bit of a **Common Person’s Big O Cheat Sheet,** along with how you might use Big O in your every day work.

Rather than base this on arrays and simplified nonsense, I’ll share with you a situation that I was in just a year ago: **choosing the right data structure in Redis.** If you’ve never used Redis before, it’s a very basic key-value store that works in-memory and can optionally persist your data to disk.

When you work in a relational database like PostgreSQL, MySQL, or SQL Server you get a single data structure: **the table**. Yes, there are data **types**, sure, but your data is stored in a row separated by columns, which is a data **structure**.

Redis gives you a bit more flexibility. You get to choose the data structure that fits your programming need the best. There are a bunch of them, but the ones I find myself using most often are:

- **String.** With this structure you store a string value (which could be JSON) with a single key.
- **Set.** A Set in Redis is a bunch of unordered, unique string values.
- **Sorted Set**. Just like a Set, but sorted.
- **List**. Non-unique string values sorted **by order of insertion**. These things operate like both stacks and queues.
- **Hash**. A set of string values identified by “sub keys”. You can think of this as a JSON object with values being only strings.

**Why are we talking about Redis when this post is about Big O**? Because *Redis and Big O go hand in hand*. To choose the right data structure for your needs, you need to dig you some Big O (whether you know it’s Big O or not).

## FINDING SOMETHING IN A SHOPPING CART

Let’s say you’re tasked with storing Shopping Cart data in Redis. Your team has decided that an in-memory system would work well because it’s fast and it doesn’t matter if cart data is lost if the server blows up.

The question is: **how do you store this information?** Here’s what’s required:

- Finding the cart quickly by key
- CRUD operations on each item within the cart
- Finding an item in the cart quickly
- Iterating over each item in the cart

Believe it or not, **you’re thinking in Big O right now** and you might not even know it. I used the words “quickly” and “iterate” above, which may or may not mean something to you in a technical sense. The thing I was trying to convey by using the word “quickly” is that I want to get to the cart (or an item within it) **directly**, without having to jump through a lot of hoops.

Even that description is really arm-wavy, isn’t it? We can dispose of the arm-waving by **thinking about things in terms of operations per input**. How many operations does my code need to perform to get to a single cart from the set of all carts in Redis?

## ONLY ONE OPERATION: *O(1)*

The cool thing about Redis is that it’s a key-value store. To find something, you just need to know its key. You don’t have to run a loop or do some complex find routine – it’s just right there for you.

When something requires only one operation we can say that directly: **my code for finding a shopping cart is on the order of 1 operation**. If we want to be Big O about it, **we can say it’s order 1, or “O(1)”**. It doesn’t matter how many carts are in our Redis database either! We have a key and we can go right to it.

A more precise way to think about this is to use the term “constant time”. It doesn’t matter how many rows of data are in our database (or, correspondingly, how many inputs to our algorithm) – the algorithm will run in **constant time** which doesn’t change.

What about the items in the cart itself?

## LOOPING OVER A SET: O(*N*)

We know that our cart will need to store 0 to *n* items. I’m using *n* here because I don’t know how many items that will be – it varies per customer.

I can use **any** of Redis’s data structures for this:

- I can store a JSON blob in a String, identified by a unique cart key
- I can store items in a Set or Sorted Set, with each item being a bit of JSON that represents a `CartItem`
- I can store things in a List in the same way as a set
- I can store things in a Hash, with each item having a unique sub key

When it comes to items in the cart, we need to be able to do CRUD stuff but we also need to be able to find an item in the cart “as quickly as possible”. If we use a String (serializing it into JSON first), a Set or a List we’ll need to loop over every item in a cart in order to find the one we’re looking for.

Rather than saying “need to loop over every item”, we can think about things in terms of operations again: **if I use a Set or a List or a String I’ll need to have one operation for every n items in my cart**. We can also say that this is “order *n*“, or just O(*n*).

You can spot O(*n*) operations easily by simply looking for loops in your code. This is my rule of thumb: “if there’s a loop, it’s O(*n*)”.

## LOOPING WITHIN A LOOP: O(*N^2*)

Let’s say we decided to keep things simple and deal with problems as they arise so we chose a Set, allowing us to dump unique blobs of JSON data that we can loop over if we need to. Unfortunately for us, this caused some issues:

![](/assets/img/posts/screenshot_57.jpg)

By changing the `quantity` in our `CartItem` we have made our JSON string unique, causing duplication. We need to remove these duplications now, otherwise our customers won’t be happy.

Simple enough to do: we just loop over the items within a cart, and then loop over the items one more time (skipping the current loop index) to see if there’s a match on `sku`. This is a classic **brute force** algorithm for deduping an array. That’s a lot of words to describe this nested loop algorithm and we can do better if we use Big O.

Thinking in terms of operations, we have *n* operations per *n* items in our cart. That’s `n * n` operations, which we can shorthand to “order *n* squared” or O(*n*^2). Put another way: **deduping an array is an O(n^2) operation, which isn’t terribly efficient**.

As I said before, I like to think of these things in terms of loops. My rule of thumb here is that if **I have to use a loop within a loop, that’s O(*n^2*)**. Another rule of thumb is that the term “brute force” almost always denotes an O(*n^2*) algorithm that uses some kind of nested loop.

## INDEXING A DATABASE TABLE AND O(*LOG N*).

If you’ve ever worked on a larger project with a DBA, you’ve probably been barked at for querying a table without utilizing an index (a “fuzzy” search, for instance). Have you ever wondered what the deal is? I have. I *was* that DBA doing the barking!

Here’s the thing: tables tend to grow over time. Let’s say that our commerce site is selling independent digital films and our catalog is constantly growing. We might have a table called `film` filled with ridiculous test data that we want to query based on `title`. Unfortunately, we don’t have an index just yet and our query is beginning to slow down. We decide to ask PostgreSQL what’s going on using `EXPLAIN` and `ANALYZE`:

![](/assets/img/posts/screenshot_58.jpg)

Our database is doing what’s called a “Sequential Scan”. In SQL Server land this is called a “Full Table Scan” and it basically means that Postgres has to loop over every row, comparing the `title` to our query argument.

In other words: a Sequential Scan is a loop over every item which means it’s O(*n*), where *n* represents the number of rows in our table. As our table grows, the efficiency of this algorithm goes down linearly.

It’s easy to improve the performance here by adding an index:

![](/assets/img/posts/screenshot_59.jpg)

Now we’re using an **Index Scan**, which is, I suppose, much faster. But how much? And how does it work?

Under the covers, most databases use a version of an algorithm called **binary search** – [I made a video](https://bigmachine.io/products/the-imposters-handbook/) about this and other algorithms which you can [watch right here](https://bigmachine.io/products/the-imposters-handbook/) if you want. For binary search to work properly, you have to sort the list of things you’re working with. That’s exactly what Postgres does when you first create the index:

![](/assets/img/posts/screenshot_61.jpg)

Now that the index is sorted, Postgres can find the `title` we’re looking for by systematically splitting this list in half until there’s only one row left, which will be the one we want.

This is much better than looping over every row (which we know is O(*n*)), but how many operations do we have here? For this we can use **logarithms:**

![](/assets/img/posts/screenshot_62.jpg)

We’re continually splitting things in half in a sorted set until we arrive at the thing we want. We can describe this with an inverted binary tree, as you see above. We start with 8 values, split, and are left with 4, which we split again to get 2, then finally 1.

This is an inverse squaring operation as we’re going from 2^3 (8) down to 2^2 (4) down to 2^1 (2) and finally 2^0 (1). Inverse squaring operations are called **logarithms**. That means that we can now describe the operations of our database index as “being logarithmic”. We should also specify “logarithmic of **what**” to which we can answer “we don’t know, so we’ll say it’s *n*“, also known as O(*log n*).

This kind of algorithm is called “divide and conquer” and when you see those words, you know immediately that you’re talking about a *log n* algorithm.

## … AND SO WHAT?

Here’s why you care about turning something that’s O(*n*) into O(*log n*) and the best part is that it’s not really arguable *because it’s math* (I was told that means you’re always right :trollface:).

Let’s say we have 1000 records in our `film` table. To find “Academy Dinosaur” our database will need to do 1000 operations (comparing the `title` in each row). But how many will it do if we use an index? Let’s use a calculator and find out, shall we? I need to find the log base 2 (because of the binary split) of 1000:

![](/assets/img/posts/screenshot_63.jpg)

Only Ten! Ten splits of 1000 records to find what we want in our database. That’s a performance gain of a few orders of magnitude, and it’s a lot more convincing to tell someone **that** as opposed to “it’s a lot faster”.

The best part here is that we can keep using this calculator to find out how many operations will be needed if we have a **million** records (it’s 20) or a **billion** (it’s 30). That kind of scaling as our inputs goes up is the stuff of DBA dreams.

## BONUS QUESTION: WHAT’S THE BIG O OF A PRIMARY KEY LOOKUP?

It’s tempting to think that if I have a primary key and I know the value of that key that I **should** be able to simply go right to it. Is that what happens? Think about it for a second and while you’re thinking let’s talk about Redis a bit more.

A major selling point of Redis (or any key-value system really) is that you can do a **lot** of stuff with O(1) **time complexity**. That’s what we’re measuring when we talk about Big O – **time complexity**, or long something takes given the inputs to an algorithm you’re working with. There’s also **space complexity** which has to do with the resources your algorithm needs, but I’ll save that for another post.

Redis is a key-value store, which means that if you have a key, you have an O(1) operation. For our Shopping Cart above, if I use a Hash I’ll have a key for the cart **as well as** a key for each item in the cart, which is huge in terms of performance – or I should say “optimal time complexity”. We can access any item in a cart without a single loop, which makes things fast. Super fast.

OK, back to the question regarding primary key queries: are they O(1)? **Nope**:

![](/assets/img/posts/screenshot_64.jpg)

Indexes in most database systems tend to use a variation of binary search, and primary key indexes are **no different**. That said, there are plenty of optimizations that databases use under the covers to make these queries extremely fast.

I should also note that some databases, like Postgres, offer you different types of indexes. For instance you can use a Hash Index with Postgres that will give you O(1) access to a given record. There is a lot going on behind the scenes, however, to the point where [there’s a pretty good debate](https://dba.stackexchange.com/questions/212685/how-is-it-possible-for-hash-index-not-to-be-faster-than-btree-for-equality-looku) about whether they’re actually faster. I’ll side step this discussion and you can go read more for yourself.

## THERE YOU HAVE IT

I find myself thinking about things in terms of Big O a lot. The cart example, above, happened to me just over a month ago and I needed to make sure that I was flexing the power of Redis as much as possible.

I don’t want to turn this into a Redis commercial, but I will say that it (and systems like it) have a lot to offer when you start thinking about things in terms of **time complexity**, which you should! **It’s not premature optimization to think about Big O upfront, it’s programming** and I don’t mean to sound snotty about that! If you can clip an O(*n*) operation down to O(*log n*) then you should, don’t you think?

So, quick review:

- Plucking an item from a list using an index or a key: O(1)
- Looping over a set of *n* items: O(*n*)
- A nested loop over *n* items: O(**n^2**)
- A divide and conquer algorithm: O(**log n**)
', NULL),
(36, 11, 'Review: Data Structures', 'review-data-structures', 'f', 'Let’s review data structures! It’s fun and exciting! In this section you’ll review and then build your very own data structures along with me! I’ll be using JavaScript to code mine, but feel free to use whatever language you like.', '', 'Review', 1, 1153, '233570103', NULL, '46298bbcdb610b84306c840ea39f4f99', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/233570103/5ab1a09b7c', '2023-03-19 09:49:30.214832-07', '2023-03-19 09:49:30.214832-07', '## The Code

To get you off the ground, feel free to use the code bits below. The first is for a basic tree Node:

```js
class Node{
  constructor(val){
    this.value = val;
    this.children = [];
  }
  addChild(val){
    const newNode = new  (val);
    this.children.push(newNode);
    return newNode;
  }
}
module.exports =  Node;
```

Here’s one for a BinaryTreeNode

```js
class BinaryTreeNode{
  constructor(val){
    this.value = val;
    this.right = null;
    this.left = null;
  }
  addRight(val){
    const newNode = new BinaryTreeNode(val);
    this.right = newNode;
    return newNode;
  }
  addLeft(val){
    const newNode = new BinaryTreeNode(val);
    this.left = newNode;
    return newNode;
  }
}
```', NULL),
(37, 11, 'Review: Algorithms and Strategies', 'review-algorithms', 'f', 'Now the fun starts! We have our data structures and now we need to focus on the algorithms we’re likely to be asked about in an interview. But that’s not enough! What you really need to do is to be able to tease out the strategy that you’ll need to use in combination with your data structures and algorithms. That will help you answer almost any interview question.', '<p>Now the fun starts! We have our data structures and now we need to focus on the algorithms we’re likely to be asked about in an interview. But that’s not enough!</p>
<p>What you really need to do is to be able to tease out the strategy that you’ll need to use in combination with your data structures and algorithms. That will help you answer almost any interview question.</p>
', 'Review', 2, 1078, '233569422', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/233569422/3df0104afb', '2023-03-19 09:49:30.217493-07', '2023-03-19 09:49:30.217493-07', 'In this review we go over the basics', NULL),
(38, 11, 'Your Interview Mindset', 'interview-mindset', 'f', 'You''re not going to make it through this section unless you have the right frame of mind. Simply wanting a job isn''t enough - you need to calm yourself and focus.', '<p>Now the fun starts! We have our data structures and now we need to focus on the algorithms we’re likely to be asked about in an interview. But that’s not enough!</p>
<p>What you really need to do is to be able to tease out the strategy that you’ll need to use in combination with your data structures and algorithms. That will help you answer almost any interview question.</p>
', 'Prep', 3, 365, '388584504', NULL, '43e3a00d694b50f56cb02a99bb3d5360', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388584504/6bd2bbddad', '2023-03-19 09:49:30.218806-07', '2023-03-19 09:49:30.218806-07', 'I know you''re wanting to jump right in and practice, but do yourself a favor and take a minute to get your head in the right place. So many people **get super frustrated** with this process and decide it''s all a bunch of crap - and then they give up and either fail the interview or cancel before they get there.

Seriously - I can''t tell you how many times I''ve heard a friend tell me how stupid Company X is becaust they wanted them to write a basic algorithm on the white board. The sentiment is always the same:

> What does writing a search algorithm have to do with my job? NOTHING. Why are they even asking me this crap!

They''re asking you these questions because, believe it or not, **people like to lie on their resume**. They don''t know you and they especially don''t know what you know. They want to be sure you can do the things you say you can do on your resume, so they''re going to ask you to solve some problems.

So, deep breath. Let''s do this - these are very good jobs and these companies want to pay you a lot of money. **Let''s show them what you can do**!

 ', NULL),
(39, 11, 'Getting Past the Screener', 'the-screening-question', 'f', 'Before you get to the white board you''ll likely have to pass an introductory screening interview - a short call (or in person meeting) to suss out what you know.', '<h1 id=nice-to-meet-you>Nice to meet you…</h1>
<p>Most companies will want to be sure you’re the right fit for their organization before scheduling a full “round” or “onsite”. There are two reasons they do this:</p>
<ul>
<li>To help you <strong>get to know the company</strong>, the job you’re applying for and the process you’re about to go through</li>
<li>To make sure <strong>you’re who you say you are and your resume</strong> is “in alignment” with your skills</li>
</ul>
<p>Here’s the simple truth: <em>people lie on their resume</em>. “Lie” might be a bit strong, but it’s true! When you need a job you need a job and people will emphasize what they need to in order to get in the door. Screeners and recruiters know this, so in this section we’re going to step through what that might look like.</p>
<h2 id=check-your-resume>Check Your Resume</h2>
<p>First things first: <em>check to be sure your resume is accurate in terms of how it portrays your skillset</em>. Did you use the words “master” or “expert”? Your screener will zero in on that <strong>guaranteed</strong>.</p>
<p><img src=https://images.unsplash.com/photo-1485988412941-77a35537dae4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80 alt=></p>
<h2 id=know-your-basics>Know Your Basics</h2>
<p>You will be studying some super tough problems in a short while - but it will all be for nothing if you forget the very basics. Let me give you an example - something that happened to me a few years ago…</p>
<blockquote>
<p>Rob, I see here that you really like Elixir and you’ve written some open source libraries with it and even given a few conference talks. I love Elixir too - great language. Would you say that Elixir supports first-class functions?</p>
</blockquote>
<p>This is going to sound absolutely crazy… but <strong>I utterly froze</strong>. I know what first-class functions are - <em>I’d written about them!</em> When you’re in an interview setting, however, and depth-first traversal is cycling in your brain, even the most basic things can completely escape you. In this instance, I saw the concept in my mind, but the exact definition and phrasing just evaporated. I said as much to my interviewer and they were understanding. Unfortunately for me, I was completely thrown off my game and struggled to get back on track.</p>
<p><img src=https://images.unsplash.com/photo-1541199249251-f713e6145474?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80 alt=></p>
<p><em>Note: if you don’t know, first-class functions are functions that are treated like any other variable. JavaScript callbacks are a prime example.</em></p>
<h2 id=ready-set>Ready, set…</h2>
<p>Let’s go through some screening questions now. I obviously don’t know your skills, but I’ll do my best for each popular language out there. Before you go on - look over your resume. See if the words I focus on are in yours. If so, translate as appropriate.</p>
', 'Prep', 4, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.219734-07', '2023-03-19 09:49:30.219734-07', 'Most companies will want to be sure you’re the right fit for their organization before scheduling a full “round” or “onsite”. There are two reasons they do this:

- To help you **get to know the company**, the job you’re applying for and the process you’re about to go through
- To make sure **you’re who you say you are and your resume** is “in alignment” with your skills

Here’s the simple truth: _people lie on their resume_. “Lie” might be a bit strong, but it’s true! When you need a job you need a job and people will emphasize what they need to in order to get in the door. Screeners and recruiters know this, so in this section we’re going to step through what that might look like.

## Check Your Resume

First things first: _check to be sure your resume is accurate in terms of how it portrays your skillset_. Did you use the words “master” or “expert”? Your screener will zero in on that **guaranteed**.

![](https://images.unsplash.com/photo-1485988412941-77a35537dae4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80)

## Know Your Basics

You will be studying some super tough problems in a short while - but it will all be for nothing if you forget the very basics. Let me give you an example - something that happened to me a few years ago…

> Rob, I see here that you really like Elixir and you’ve written some open source libraries with it and even given a few conference talks. I love Elixir too - great language. Would you say that Elixir supports first-class functions?

This is going to sound absolutely crazy… but **I utterly froze**. I know what first-class functions are - _I’d written about them!_ When you’re in an interview setting, however, and depth-first traversal is cycling in your brain, even the most basic things can completely escape you. In this instance, I saw the concept in my mind, but the exact definition and phrasing just evaporated. I said as much to my interviewer and they were understanding. Unfortunately for me, I was completely thrown off my game and struggled to get back on track.

![](https://images.unsplash.com/photo-1541199249251-f713e6145474?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80)


_Note: if you don’t know, first-class functions are functions that are treated like any other variable. JavaScript callbacks are a prime example._

## Ready, set…

Let’s go through some screening questions now. I obviously don’t know your skills, but I’ll do my best for each popular language out there. Before you go on - look over your resume. See if the words I focus on are in yours. If so, translate as appropriate.

', NULL),
(40, 11, 'Databases: How Would You Implement...?', 'screener-database', 'f', 'Screener questions tend to have a bit more broad and, typically, based on your experience... sometimes not. Think about how you would answer this one about databases.', '<p>You’re sitting at your kitchen table at home and the house is quiet and hopefully remains so. You have a glass of water next to you and you’re looking forward to the initial interview, even if you’re a bit nervous. You make sure you’re not backlit by sitting in front of a bright window and you check your audio/video settings for the third time - you don’t want to waste time with “can you hear me???”</p>
<p>The clock ticks 1pm and you click the link for the Zoom meeting and see a person is waiting for you there. Her name is Samantha and she’s the head of the data team at Company X.</p>
<p><img src=https://kajabi-storefronts-production.global.ssl.fastly.net/kajabi-storefronts-production/products/392136/images/6k2G9BxYTRGM36Gd8aIo_shot_158.jpg alt=></p>
<blockquote>
<p>Good morning, how are you today! Thank you so much for taking the time to talk with us. Before I go on - are there any questions you have for me?</p>
</blockquote>
<p>You know it’s good form to ask at least a few questions and you do, inquiring about the job and maybe a bit more about Samantha’s duties. Eight minutes go by and she moves the conversation back toward you.</p>
<blockquote>
<p>I looked over your resume and I can see you’ve done a lot of work with databases. Tell me about…</p>
</blockquote>
<p>She asks you a few light questions about a job you had as the “developer DBA” at your last startup using MongoDB and, more recently, about some light analytics work you did using PostgreSQL. She pauses… here it comes…</p>
<h2 id=the-question>The Question</h2>
<p>The smile fades a bit and her face becomes a bit more serious - a queue for you so you know a technical question is about to be asked…</p>
<blockquote>
<p>If I was to ask you to implement an indexing engine for a database we were developing, how do you think you would implement it? Just a simple one at first…</p>
</blockquote>
<p><img src=https://paper-attachments.dropbox.com/s_0A297262176913765BACF614D9F9AF16CCD38442FDA0AEA27A4FBA00AB0B06A8_1585599991977_shot_147.jpg alt=></p>
<p>You take a second and think about the question. You remember that it’s a good idea to make sure you understand what’s being asked, so you begin to form some questions in your mind:</p>
<ul>
<li>I assume this is a fictional product and that it has no indexing just yet? <strong>Yes, that’s correct.</strong></li>
<li>Will the index be used to for string queries or more structured data? <strong>String data.</strong></li>
<li>I’m also going to assume this index will be used for rudimentary query optimization at a smaller scale - say up to a few million rows. Can I also assume concurrency won’t be a consideration just yet? <strong>Yes those assumptions are fine</strong></li>
</ul>
<h2 id=your-answer>Your Answer</h2>
<p>OK, before you read on, <strong>consider how you might answer this</strong>. Take a second and put down your phone/ipad/laptop (or just look away from the monitor) and practice answering this. It’s entirely likely you might not know anything about database indexes which is just fine… but then again you actually might know some basics about how they work. It’s all data structures and algorithms after all! If you’re totally in the dark on this that’s OK, read on just for fun to see how you might answer something more relevant to you.</p>
<h3 id=the-simple-version>The Simple Version</h3>
<p>Most databases have some form of indexing that allows for faster searching and querying. Some databases, like PostgreSQL, allow you to choose what type of index you want to use - such as HASH, BTREE, GIN or GIST (among others). Each of these stores data in a particular way. Other databases have only a single type but they all do the same thing under the hood: pre-load some data into a data structure which is optimized for a search algorithm later on.</p>
<p>The simplest example which would answer the question above is to store the data pre-sorted so you could use something like binary search later on. For instance, you might want to index a <code>users</code> table on their email address. The index would sort all of the user records based on email in the background and you could then query that index using binary search.</p>
<h3 id=the-more-complete-version>The More Complete Version</h3>
<p>An answer that shows that you know your data structures and algorithms (which I hope you do by now!) would be to use something like a balanced binary tree to store the data with depth-first search for the query. Do you have other ideas on this? Great! However… Samantha wants to know how much you know databases. It might be tempting to go on about index theory but resist the urge… no one wants to work with a showoff!</p>
<h2 id=summary>Summary</h2>
<p>The goal with this scenario is not to prove how much you know about databases, but to see how an intimidating question such as “can you build an indexing engine” can be broken down to an acceptable answer if you:</p>
<ul>
<li>Make sure to ask questions</li>
<li>Calm yourself if you feel out of your depth</li>
<li>Remember your data structures and algorithms - the answer might be right there!</li>
</ul>
<p>And finally - if you <em>really</em> know an answer, show it by being as concise as you can.</p>
', 'Prep', 5, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.220993-07', '2023-03-19 09:49:30.220993-07', 'You’re sitting at your kitchen table at home and the house is quiet and hopefully remains so. You have a glass of water next to you and you’re looking forward to the initial interview, even if you’re a bit nervous. You make sure you’re not backlit by sitting in front of a bright window and you check your audio/video settings for the third time - you don’t want to waste time with “can you hear me???”

The clock ticks 1pm and you click the link for the Zoom meeting and see a person is waiting for you there. Her name is Samantha and she’s the head of the data team at Company X.

![](/img/posts/the-screening-question.jpg)

> Good morning, how are you today! Thank you so much for taking the time to talk with us. Before I go on - are there any questions you have for me?

You know it’s good form to ask at least a few questions and you do, inquiring about the job and maybe a bit more about Samantha’s duties. Eight minutes go by and she moves the conversation back toward you.

> I looked over your resume and I can see you’ve done a lot of work with databases. Tell me about…

She asks you a few light questions about a job you had as the “developer DBA” at your last startup using MongoDB and, more recently, about some light analytics work you did using PostgreSQL. She pauses… here it comes…

## The Question

The smile fades a bit and her face becomes a bit more serious - a queue for you so you know a technical question is about to be asked…

> If I was to ask you to implement an indexing engine for a database we were developing, how do you think you would implement it? Just a simple one at first…
> 
![](https://paper-attachments.dropbox.com/s_0A297262176913765BACF614D9F9AF16CCD38442FDA0AEA27A4FBA00AB0B06A8_1585599991977_shot_147.jpg)


You take a second and think about the question. You remember that it’s a good idea to make sure you understand what’s being asked, so you begin to form some questions in your mind:

- I assume this is a fictional product and that it has no indexing just yet? **Yes, that’s correct.**
- Will the index be used to for string queries or more structured data? **String data.**
- I’m also going to assume this index will be used for rudimentary query optimization at a smaller scale - say up to a few million rows. Can I also assume concurrency won’t be a consideration just yet? **Yes those assumptions are fine**


## Your Answer

OK, before you read on, **consider how you might answer this**. Take a second and put down your phone/ipad/laptop (or just look away from the monitor) and practice answering this. It’s entirely likely you might not know anything about database indexes which is just fine… but then again you actually might know some basics about how they work. It’s all data structures and algorithms after all! If you’re totally in the dark on this that’s OK, read on just for fun to see how you might answer something more relevant to you.

### The Simple Version

Most databases have some form of indexing that allows for faster searching and querying. Some databases, like PostgreSQL, allow you to choose what type of index you want to use - such as HASH, BTREE, GIN or GIST (among others). Each of these stores data in a particular way. Other databases have only a single type but they all do the same thing under the hood: pre-load some data into a data structure which is optimized for a search algorithm later on.

The simplest example which would answer the question above is to store the data pre-sorted so you could use something like binary search later on. For instance, you might want to index a `users` table on their email address. The index would sort all of the user records based on email in the background and you could then query that index using binary search.

### The More Complete Version

An answer that shows that you know your data structures and algorithms (which I hope you do by now!) would be to use something like a balanced binary tree to store the data with depth-first search for the query. Do you have other ideas on this? Great! However… Samantha wants to know how much you know databases. It might be tempting to go on about index theory but resist the urge… no one wants to work with a showoff!

## Summary

The goal with this scenario is not to prove how much you know about databases, but to see how an intimidating question such as “can you build an indexing engine” can be broken down to an acceptable answer if you:

- Make sure to ask questions
- Calm yourself if you feel out of your depth
- Remember your data structures and algorithms - the answer might be right there!

And finally - if you _really_ know an answer, show it by being as concise as you can.', NULL),
(41, 11, 'JavaScript: What Time Is It?', 'screener-javascript-time', 'f', 'Sometimes a potential interviewer will ''cosplay'' with you - pretending that you work at the company and seeing how you might solve one of their realworld problems.', '<h1 id=javascript-what-time-is-it>JavaScript: What Time Is It?</h1>
<p>It&#39;s Thursday morning at 10am and you&#39;re sitting at home in your bedroom, waiting for the phone to ring. The recruiter you&#39;ve been working with said that Santosh, an engineer on Team X with Company Y was going to call and have a brief chat - no more than 30 minutes.</p>
<blockquote>
<p>This is a screening call and they’re going to ask a few questions about what’s on your resume. Please be sure it’s up to date.</p>
</blockquote>
<p>You’ve gone over your resume and feel good about it. In particular, you’ve described how you’ve been working with NodeJS exclusively for the last 8 years, leading a team of 5 developers and shipping a core feature at your last company. On your resume, you described your NodeJS (and JavaScipt) knowledge as:</p>
<blockquote>
<p>Highly proficient with NodeJS and JavaScript as well as various front-end frameworks, including VueJS, React and Angular.</p>
</blockquote>
<p>The phone rings. Here we go…</p>
<h2 id=the-question>The Question</h2>
<p>Santosh is well-spoken and very kind, asking you a bit about your past work which you describe in concise detail. He then says “would you mind if I asked you a quick technical question?” “Of course, please do” you reply.</p>
<blockquote>
<p>You mention that you’re highly proficient with NodeJS and JavaScript, and I wonder if you could offer your thoughts with a problem that we ran into last week using dates. JavaScript has a fun history of weird results, but this one had us going for a while…</p>
</blockquote>
<p>This is the problem when you say your good at a language - other developers will wonder just how far to the edge you’ve gone. The “have you ever had to deal with” questions are common, so know your language quirks!</p>
<blockquote>
<p>We pull transaction data from an online service and recently we noticed the dates we were storing were off by 6 hours in the past from what they should be. So if a transaction was recorded at exactly midnight on the first of April, we were recording it as 6:00pm on March 31st. We store dates in GMT, just like the service we use. We ended up solving the problem - but I’m curious - how would you go about figuring this problem out?</p>
</blockquote>
<p>You laugh nervously: quirky JavaScript problems are fun and are all too common. You have some ideas about this, but he’s asked you a specific style of question: <em>how would you go about figuring this out?</em></p>
<h2 id=the-answer>The Answer</h2>
<p>This isn’t supposed to be a technical question where you get up and write on a white board - this is a problem-solving question to see if you can suss out where the problem might be and how you would implement a solution. The biggest part of this question, however, is how you might interact with the rest of the team. Would you try to solve this on your own, or would you involve others?<br>So*: how would you solve this?* Think about it a bit before reading on and practice speaking about it aloud. Maybe write down your answer if you don’t feel comfortable…</p>
<h2 id=pairing-on-the-problem><strong>Pairing on the Problem</strong></h2>
<p>This is a great time for you to show how well you could fit on the team. You’re in the conference room and one of your colleagues walks in with a great JavaScript head-scratcher - let’s see what we can do!<br>Pretend this is a pair-programming session. There are a number of questions you can use to help sleuth the problem, such as:</p>
<ul>
<li>I know you’ve been thinking about this for a while but sometimes when you describe the problem to someone else, a solution pops to mind. Given that - is this a new thing? I assume we’ve been tracking dates correctly up until a short while ago? <strong>Yes, that’s correct</strong>.</li>
<li>Have you isolated when the change occurred? <strong>Yes, we have - it happened 2 days ago during an hourly ingestion we run at 10pm.</strong></li>
<li>Did this coincide with any changes to production? <strong>We thought the same thing immediately - but no. We push on a regular cycle but our code update happened earlier in the day at 8am and 13 ingestions happened after that without a problem.</strong></li>
<li>My first thought is that something changed with the API you’re pulling data from. Have you run a diff on the data right before and right after problem ingestion? <strong>Yes, we did and we found a small difference to the way the dates were sent over. At first it seemed trivial - but maybe you can spot a problem? Here, I’ll text you a screenshot I just took from my browser window. I’m in Hawaii at a conference…</strong></li>
</ul>
<p><img src=https://paper-attachments.dropbox.com/s_055791361120598582A8DB69862B16CDA47EF615E8025E12C387F31BF761937B_1585604553142_shot_149.jpg alt=></p>
<p>You look over the dates and … yeah ouch! At this point your first reflex is pile on JavaScript like so many do, but then you remember that it&#39;s probably not a good idea to be snarky and dismissive in an interview. Instead, you decide to lean on your professional curiosity.</p>
<p>JavaScript has been around a while, you would <em>think</em> a quirk like this would be addressed. Then again, whenever people get upset about JavaScript’s behavior, someone always chimes in with a logical answer. You understand that a positive attitude is the goal here. You might know the answer right off the top of your head (if you do - good for you!). Let’s pretend you didn’t, however…</p>
<blockquote>
<p>I haven’t encountered this problem before, but my guess is that it has to do with timezones. From the screenshot you sent me I can see the difference in dates is 10 hours - which is also the offset from GMT. That seems like too strong a coincidence. It would be interesting to find out why, but to fix this problem in the short term I would probably run a replacement over the dates, replacing the spaces with a forward slash and then update the &quot;bad&quot; data we have to the correct time/date.</p>
</blockquote>
<h2 id=good-job>Good Job!</h2>
<p>Screeners want to know if you&#39;re going to fit on a team, which means the questions they ask will likely be less technical and more designed to figure out what type of teammate you&#39;ll be.<br>Remember to remain professional, curious, and polite! Interviews are stressful and it&#39;s all too easy to let that overflow into frustration.</p>
', 'Prep', 6, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.226044-07', '2023-03-19 09:49:30.226044-07', 'It''s Thursday morning at 10am and you''re sitting at home in your bedroom, waiting for the phone to ring. The recruiter you''ve been working with said that Santosh, an engineer on Team X with Company Y was going to call and have a brief chat - no more than 30 minutes.

> This is a screening call and they’re going to ask a few questions about what’s on your resume. Please be sure it’s up to date.

You’ve gone over your resume and feel good about it. In particular, you’ve described how you’ve been working with NodeJS exclusively for the last 8 years, leading a team of 5 developers and shipping a core feature at your last company. On your resume, you described your NodeJS (and JavaScipt) knowledge as:

> Highly proficient with NodeJS and JavaScript as well as various front-end frameworks, including VueJS, React and Angular.

The phone rings. Here we go…

## The Question

Santosh is well-spoken and very kind, asking you a bit about your past work which you describe in concise detail. He then says “would you mind if I asked you a quick technical question?” “Of course, please do” you reply.

> You mention that you’re highly proficient with NodeJS and JavaScript, and I wonder if you could offer your thoughts with a problem that we ran into last week using dates. JavaScript has a fun history of weird results, but this one had us going for a while…

This is the problem when you say your good at a language - other developers will wonder just how far to the edge you’ve gone. The “have you ever had to deal with” questions are common, so know your language quirks!

> We pull transaction data from an online service and recently we noticed the dates we were storing were off by 6 hours in the past from what they should be. So if a transaction was recorded at exactly midnight on the first of April, we were recording it as 6:00pm on March 31st. We store dates in GMT, just like the service we use. We ended up solving the problem - but I’m curious - how would you go about figuring this problem out?

You laugh nervously: quirky JavaScript problems are fun and are all too common. You have some ideas about this, but he’s asked you a specific style of question: _how would you go about figuring this out?_

## The Answer

This isn’t supposed to be a technical question where you get up and write on a white board - this is a problem-solving question to see if you can suss out where the problem might be and how you would implement a solution. The biggest part of this question, however, is how you might interact with the rest of the team. Would you try to solve this on your own, or would you involve others?
So*: how would you solve this?* Think about it a bit before reading on and practice speaking about it aloud. Maybe write down your answer if you don’t feel comfortable…

## **Pairing on the Problem** 

This is a great time for you to show how well you could fit on the team. You’re in the conference room and one of your colleagues walks in with a great JavaScript head-scratcher - let’s see what we can do!
Pretend this is a pair-programming session. There are a number of questions you can use to help sleuth the problem, such as:

- I know you’ve been thinking about this for a while but sometimes when you describe the problem to someone else, a solution pops to mind. Given that - is this a new thing? I assume we’ve been tracking dates correctly up until a short while ago? **Yes, that’s correct**.
- Have you isolated when the change occurred? **Yes, we have - it happened 2 days ago during an hourly ingestion we run at 10pm.**
- Did this coincide with any changes to production? **We thought the same thing immediately - but no. We push on a regular cycle but our code update happened earlier in the day at 8am and 13 ingestions happened after that without a problem.**
- My first thought is that something changed with the API you’re pulling data from. Have you run a diff on the data right before and right after problem ingestion? **Yes, we did and we found a small difference to the way the dates were sent over. At first it seemed trivial - but maybe you can spot a problem? Here, I’ll text you a screenshot I just took from my browser window. I’m in Hawaii at a conference…**


![](https://paper-attachments.dropbox.com/s_055791361120598582A8DB69862B16CDA47EF615E8025E12C387F31BF761937B_1585604553142_shot_149.jpg)

You look over the dates and … yeah ouch! At this point your first reflex is pile on JavaScript like so many do, but then you remember that it''s probably not a good idea to be snarky and dismissive in an interview. Instead, you decide to lean on your professional curiosity.

JavaScript has been around a while, you would _think_ a quirk like this would be addressed. Then again, whenever people get upset about JavaScript’s behavior, someone always chimes in with a logical answer. You understand that a positive attitude is the goal here. You might know the answer right off the top of your head (if you do - good for you!). Let’s pretend you didn’t, however…

> I haven’t encountered this problem before, but my guess is that it has to do with timezones. From the screenshot you sent me I can see the difference in dates is 10 hours - which is also the offset from GMT. That seems like too strong a coincidence. It would be interesting to find out why, but to fix this problem in the short term I would probably run a replacement over the dates, replacing the spaces with a forward slash and then update the bad data we have to the correct time/date.

## Good Job!

Screeners want to know if you''re going to fit on a team, which means the questions they ask will likely be less technical and more designed to figure out what type of teammate you''ll be.
Remember to remain professional, curious, and polite! Interviews are stressful and it''s all too easy to let that overflow into frustration.

', NULL),
(42, 11, 'Understanding the Mechanics of The Interview Question', 'mechanics-of-coding-questions', 'f', 'Don''t hate me... and PLEASE don''t skip this video. Let''s walk through Fibonacci together as a way of understanding how interviewers will flex and extend a single question to dig into your brain.', '<p>OK let&#39;s see if you&#39;re chilled out and focused enough to tackle the tougher problems ahead. In this video I&#39;m going to walk you through the dumbest of interview questions <strong>but I&#39;m going to do it from the perspective of the interviewer</strong>. </p>
<p>It&#39;s critical that you understand what it is they&#39;re trying to find out and how they&#39;ll use these questions to dig into your problem solving abilities.</p>
<p>And here&#39;s a super critical tip: <em>almost no one gets these things right the first time</em>. As you&#39;re about to see - the goal is not to get the question right, it&#39;s to show the interviewer how you approach and try to solve a problem.</p>
<p>Here&#39;s another super critical tip: <strong>people that aren&#39;t qualified for a job get the most defensive and angry</strong>. Your interviewer will be looking for this!</p>
', 'Prep', 7, 724, '388583617', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388583617/2d632b3da9', '2023-03-19 09:49:30.228562-07', '2023-03-19 09:49:30.228562-07', 'OK let''s see if you''re chilled out and focused enough to tackle the tougher problems ahead. In this video I''m going to walk you through the dumbest of interview questions **but I''m going to do it from the perspective of the interviewer**. 

It''s critical that you understand what it is they''re trying to find out and how they''ll use these questions to dig into your problem solving abilities.

And here''s a super critical tip: _almost no one gets these things right the first time_. As you''re about to see - the goal is not to get the question right, it''s to show the interviewer how you approach and try to solve a problem.

Here''s another super critical tip: **people that aren''t qualified for a job get the most defensive and angry**. Your interviewer will be looking for this!', NULL),
(43, 11, 'Practice: Stock Price Calculation', 'practice-question-stock-prices', 'f', 'This is a real interview question that comes straight from Amazon. You''ll be writing this one by hand so remember your strategies.', '', 'Practice', 8, 1238, '388585030', NULL, 'cffc8c2fb5c37adf503abba6c5b557eb', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388585030/1dd5b72552', '2023-03-19 09:49:30.234921-07', '2023-03-19 09:49:30.234921-07', 'OK grab your journal and dive in with me! I''ll be solving this question by hand I urge you to do the same. I''ll show you the solution near the end - but give it your best shot!

This question is from InterviewCake - thanks to Parker Phinney for permission to use. You can solve it there right now, if you like, as it’s part of the free questions.

Here’s the question:

> Write an efficient function that takes stockPricesYesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

Starter code:

```js
//The values are the price in dollars of Apple stock at that time.
var stockPricesYesterday = [10, 7, 5, 8, 11, 9];

getMaxProfit(stockPricesYesterday);
// returns 6 (buying for $5 and selling for $11)
```', NULL),
(44, 11, 'Practice: Product of All Numbers But This', 'practice-product-of-all-numbers-but-this', 'f', 'A straightforward problem that, at first, seems daunting - until you break it down and apply the strategies you know.', '', 'Practice', 9, 1362, '388586544', NULL, '150dd64af5b8f4aa09007e5692eaaf7c', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388586544/1aeb5e72b3', '2023-03-19 09:49:30.236929-07', '2023-03-19 09:49:30.236929-07', 'Here''s another practice question from Interview Cake, who kindly allowed me to use this other questions in this production. 

Once again - I encourage you to do your best before watching all of the video. We can then try to solve it together!

Here’s the question:

> Write a function getProductsOfAllIntsExceptAtIndex() that takes an array of integers and returns an array of the products.

Starter code:

```js
//Given...
[1, 7, 3, 4]

//Return 
[84, 12, 28, 21]

//... in other words...
[7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
```', NULL),
(45, 11, 'Practice: Smallest Range of K Lists', 'practice-question-smallest-range-of-k-lists', 'f', 'This is a tough one and you might struggle with it some. If you do, practice speaking aloud to get help from the interviewer.', '', 'Practice', 10, 1362, '388585868', NULL, '071520de2325cc996fa5df0955f001d1', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388585868/50abfde3f3', '2023-03-19 09:49:30.237953-07', '2023-03-19 09:49:30.237953-07', 'This one is a bit tougher so don''t feel bad if you don''t finish. Again: the point is to demonstrate your thinking process and that you ask enough questions and think things through before you write any code.

Here’s the question:

> You have k lists of sorted integers. Find the smallest range that includes at least one number from each of the k lists.

Here''s some sample code

```js
// For example,
list1 = [4, 10, 15, 24, 26];
list2 = [0, 9, 12, 20];
list3 = [5, 18, 22, 30];
```', NULL),
(46, 11, 'Jon Skeet: Creating a C# Linter', 'jon-skeet-creating-a-c-linter', 't', 'Another traditional question: create a linter for X language. This is more about parsing a string and remembering where you are within it.', '', 'Practice', 11, 1187, '388588760', NULL, '9479f30f2010bbf7225cb3bfd1cb78a1', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388588760/a1c65adbe9', '2023-03-19 09:49:30.239022-07', '2023-03-19 09:49:30.239022-07', 'We''re going to start Jon off with a bit of a softball, asking him to create a linter for C#. Here’s the question:

> Create a linter for C# which ensures that code structures are balanced. Specifically, code blocks starting with (, { and [.

Normally this question would take a candidate about 30 minutes, even if they haven''t studied their interview questions.

Code is just a string and we''re checking to make sure that certain characters have their counterparts. How would you solve this? Think about it for a minute and see if your ideas match Jon''s.

We''ll be using C# for this and the rest of the questions.', NULL),
(47, 11, 'Jon Skeet: Falling From Great Heights', 'jon-skeet-falling-from-great-heights', 'f', 'Not all interview questions have to do with code - some are purely logical, designed to see how you would try and solve a really, really hard problem. Skeet couldn''t figure this one out...', '<p>It&#39;s time for the dreaded logic puzzle. You&#39;ll likely get one of these if you&#39;re interviewing at a larger tech company like Google, Microsoft, Amazon or Facebook. Other companies might throw one of these at you too, just for kicks.</p>
<p>The idea here is to dig deep into your logical thinking process, not to actually solve the problem. As you&#39;re about to see, thinking about the problem can often be much more fun than solving it.</p>
<p>This video is a long one because the question is designed to take you the entire time to answer - usually around 45 minutes to an hour. If you figure it out, good work!</p>
<p>Here’s the question:</p>
<blockquote>
<p>You’re Jon Skeet… Chuck Norris of programming. You’ve decided to move on from your career as a Stack Overflow freak show so you can star in movies, just like Chuck - but you think you might be able to up his game! You want to see just how high you can jump from a building because YOU are going to be a STUNT MAN.</p>
</blockquote>
<blockquote>
<p>You’ve decided to come to the US - to Chicago to be specific - to see which floor of the John Hancock building (which is 100 stories high) will be the highest possible floor you can jump from. You’ve been given two crash-test dummy Skeets that will simulate your superhero frame - so if they are destroyed… so will you be destroyed.</p>
</blockquote>
<blockquote>
<p>Unlike you, these dummies don’t have much resilience - if you drop them too many times and they will also be destroyed! So we need to make sure we drop them the fewest possible times. How many drops will it take to find the highest possible floor…</p>
</blockquote>
<p>This is a logic question designed to take as long as you’ve got. There’s no code for this one.</p>
', 'Practice', 12, 2239, '388590725', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388590725/024dfa51f6', '2023-03-19 09:49:30.239938-07', '2023-03-19 09:49:30.239938-07', 'It''s time for the dreaded logic puzzle. You''ll likely get one of these if you''re interviewing at a larger tech company like Google, Microsoft, Amazon or Facebook. Other companies might throw one of these at you too, just for kicks.

The idea here is to dig deep into your logical thinking process, not to actually solve the problem. As you''re about to see, thinking about the problem can often be much more fun than solving it.

This video is a long one because the question is designed to take you the entire time to answer - usually around 45 minutes to an hour. If you figure it out, good work!

Here’s the question:

> You’re Jon Skeet… Chuck Norris of programming. You’ve decided to move on from your career as a Stack Overflow freak show so you can star in movies, just like Chuck - but you think you might be able to up his game! You want to see just how high you can jump from a building because YOU are going to be a STUNT MAN.

> You’ve decided to come to the US - to Chicago to be specific - to see which floor of the John Hancock building (which is 100 stories high) will be the highest possible floor you can jump from. You’ve been given two crash-test dummy Skeets that will simulate your superhero frame - so if they are destroyed… so will you be destroyed.

> Unlike you, these dummies don’t have much resilience - if you drop them too many times and they will also be destroyed! So we need to make sure we drop them the fewest possible times. How many drops will it take to find the highest possible floor…

This is a logic question designed to take as long as you’ve got. There’s no code for this one.', NULL),
(48, 11, 'Jon Skeet: Binary Tree Troubles', 'jon-skeet-binary-tree-troubles', 'f', 'It''s a rule of interviews: ''ask a binary tree question'' and that''s exactly what I do in this video with Jon. Traversing in different ways, trying to balance along the way.', '', 'Practice', 13, 2327, '388588202', NULL, '121afe4a1164f28371319cb771a4adf2', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388588202/874de1d51d', '2023-03-19 09:49:30.241267-07', '2023-03-19 09:49:30.241267-07', 'This question is seemingly simple:

> Decide if a tree is a binary tree

and then…

> Decide if the tree is balanced

Another super common question you will likely be asked in one form or another. Interviewers just LOVE questions about binary tree traversal! 

This question should take 30 minutes.

Some code to get you started:

```js
//you can use an Array as a Stack or a Queue in ES6 as well
class TreeNode{
  constructor(val){
    this.value = val;

  }
  addRight(val){
    this.right = new TreeNode(val);
    return this.right;
  }
  addLeft(val){
    this.left = new TreeNode(val);
    return this.left;
  }
}
```', NULL),
(49, 11, 'Jon Skeet: Creating a Queue from Scratch', 'jon-skeet-creating-a-queue-from-scratch', 'f', 'This is another very popular question from larger companies, and requires you to be familiar with linked lists, arrays and stacks.', '<p>This question is a bit simpler - but if you&#39;re a C# person it might be a bit from left field as .NET folks typically don&#39;t think about stacks and queues very much. It&#39;s a good thing to know as they&#39;re used in interviews quite often.</p>
<p>This question is a bit vague as I decided to “evolve” it as Jon coded. I started with:</p>
<blockquote>
<p>Assume there are no other list types in .NET other than a Stack and a Linked List. Create a Queue</p>
</blockquote>
<p>Which evolved to …</p>
<blockquote>
<p>Create a Queue from two stacks.</p>
</blockquote>
<p>If you want to follow along in JavaScript feel free. An Array can be used as a stack with push and pop.</p>
', 'Practice', 14, 2051, '388589709', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388589709/b68ccfec10', '2023-03-19 09:49:30.242805-07', '2023-03-19 09:49:30.242805-07', 'This question is a bit simpler - but if you''re a C# person it might be a bit from left field as .NET folks typically don''t think about stacks and queues very much. It''s a good thing to know as they''re used in interviews quite often.

This question is a bit vague as I decided to “evolve” it as Jon coded. I started with:

> Assume there are no other list types in .NET other than a Stack and a Linked List. Create a Queue

Which evolved to …

> Create a Queue from two stacks.

If you want to follow along in JavaScript feel free. An Array can be used as a stack with push and pop.', NULL),
(50, 11, 'Jon Skeet: Anagram Checker', 'jon-skeet-anagram-checker', 'f', 'Let''s end things with one that''s a bit simpler - creating a string walking function that evaluates anagrams.', '<p>This is a basic string manipulation question that I made Jon do on a Google document, far away from Visual Studio. Not only that, he had to use .NET 1.1.</p>
<p>In this question, I asked Jon to create a routine that would check an array of words. His job was to evaluate each word and decide which were anagrams of the others. Not only that, but this time he doesn&#39;t get to use his IDE - I made him use a Google document and then, at the end, I made him check to see if it would compile...</p>
<p>Here’s the question:</p>
<blockquote>
<p>Given an array of strings, return the strings that are anagrams.</p>
</blockquote>
', 'Practice', 15, 1108, '388587101', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/388587101/37e73b1591', '2023-03-19 09:49:30.243716-07', '2023-03-19 09:49:30.243716-07', 'This is a basic string manipulation question that I made Jon do on a Google document, far away from Visual Studio. Not only that, he had to use .NET 1.1.

In this question, I asked Jon to create a routine that would check an array of words. His job was to evaluate each word and decide which were anagrams of the others. Not only that, but this time he doesn''t get to use his IDE - I made him use a Google document and then, at the end, I made him check to see if it would compile...

Here’s the question:

> Given an array of strings, return the strings that are anagrams.', NULL),
(51, 11, 'Good Luck! You Got This…', 'good-luck', 'f', 'You''ve got this - good luck! Study, remember your strategies and be your best you.', '<p>I hope this set of videos has been helpful. You will get there if you just <em>keep focused and keep trying</em>. As I keep mentioning: it&#39;s likely you won&#39;t make it through on your first try... these interviews are tough!</p>
<p>What you&#39;re going through now will be the stuff of fun stories later on - just focus on keeping a positive mindset. It&#39;s sooooo easy to let the frustration take you over, making you want to throw in the towel and give up entirely.</p>
<p><strong>Please don&#39;t</strong>. These interviews are hard for a reason: the jobs pay well and some of these companies are the best to work for in the entire world. These jobs are amazing - it&#39;s not easy to get in.</p>
<p>You might have to try three or four times to make it in... but it&#39;s worth it and you can do it. You really can.<br>Good luck to you, and stay frosty!</p>
', 'Summary', 16, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.252119-07', '2023-03-19 09:49:30.252119-07', 'I hope this set of videos has been helpful. You will get there if you just _keep focused and keep trying_. As I keep mentioning: it''s likely you won''t make it through on your first try... these interviews are tough!

What you''re going through now will be the stuff of fun stories later on - just focus on keeping a positive mindset. It''s sooooo easy to let the frustration take you over, making you want to throw in the towel and give up entirely.

**Please don''t**. These interviews are hard for a reason: the jobs pay well and some of these companies are the best to work for in the entire world. These jobs are amazing - it''s not easy to get in.

You might have to try three or four times to make it in... but it''s worth it and you can do it. You really can.
Good luck to you, and stay frosty!', NULL),
(52, 18, 'Welcome!', 'welcome', 't', 'You''re about to dive into the glorious world of databases and the language of data - SQL. Lucky you! Our working data set will be the actual data from the Cassini mission, specifically that of Enceladus, an icy moon orbiting Saturn that is confounding scientists.', '<p>Many programmers are resistant to learning SQL, which is unfortunate! Learning this simple language can help you in so, so many ways, including:</p><p> - **Sleuthing and problem solving!** You''ll be the go-to person when that ORM that your project is using just can''t get the job done.</p><p> - **Career Security**. Let''s face it, the database person on any project typically has the least to worry about when it comes to keeping their jobs. It''s an incredibly important position!</p><p> - **It''s just plain fun**. Working with data is one of the most joyful things you can do as a developer. Just ask any DBA!</p><p>I started my career as the go-to data person at a large environmental company. I kind of fell backwards into it, working with Microsoft Access and then SQL Server. I learned database theory on the fly and mastered SQL quickly - a language that I still use routinely.</p><p>## The Code</p><p>If you haven''t, please be sure to [download the code](https://firebasestorage.googleapis.com/v0/b/project-8588976765518720764.appspot.com/o/sql-orbit%2Fsql_in_orbit.zip?alt=media&amp;token=448362d4-0c02-4a32-a853-34e635e0d179) from here. It''s a hefty download - right around 600Mb.</p>', 'Introduction', 1, 317, '652767714', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652767714/cfd21319d5', '2023-03-19 09:49:30.303811-07', '2023-03-19 09:49:30.303811-07', 'Many programmers are resistant to learning SQL, which is unfortunate! Learning this simple language can help you in so, so many ways, including:

 - **Sleuthing and problem solving!** You''ll be the go-to person when that ORM that your project is using just can''t get the job done.
 - **Career Security**. Let''s face it, the database person on any project typically has the least to worry about when it comes to keeping their jobs. It''s an incredibly important position!
 - **It''s just plain fun**. Working with data is one of the most joyful things you can do as a developer. Just ask any DBA!

I started my career as the go-to data person at a large environmental company. I kind of fell backwards into it, working with Microsoft Access and then SQL Server. I learned database theory on the fly and mastered SQL quickly - a language that I still use routinely.

## The Code

If you haven''t, please be sure to [download the code](https://firebasestorage.googleapis.com/v0/b/project-8588976765518720764.appspot.com/o/sql-orbit%2Fsql_in_orbit.zip?alt=media&token=448362d4-0c02-4a32-a853-34e635e0d179) from here. It''s a hefty download - right around 600Mb.
', NULL),
(53, 18, 'Flybys: Introduction', 'flybys-intro', 'f', 'We have our tools and our initial extraction ready to go, now let''s get to work finding the flybys of Enceladus! In this section we''ll focus on transforming this data into something we can query with some degree of confidence and then, hopefully, we''ll find the exact time windows for the flybys.', '<p>The data is loaded up, now let&#39;s roll up our DBA sleeves and get to work! We&#39;ll start by creating a workspace:</p>
<pre><code class=language-bash><span class=hljs-built_in>mkdir</span> enceladus
<span class=hljs-built_in>touch</span> enceladus/load.sql
</code></pre>
', 'Find the Flybys', 10, 131, '652769900', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769781/58a4fb5087', '2023-03-19 09:49:30.305426-07', '2023-03-19 09:49:30.305426-07', 'The data is loaded up, now let''s roll up our DBA sleeves and get to work! We''ll start by creating a workspace:

```bash
mkdir enceladus
touch enceladus/load.sql
```
', NULL),
(54, 18, 'Concept: Normalization', 'normalization', 'f', 'Structuring a relational database is (typically) all about following the rules of normalization, called normal forms. Sounds theoretical, but it''s pretty straightforward.', '<p>Normalizing data is all about turning one or more &quot;flat files&quot; (like CSVs, tab-delimited data, XML or JSON) into a set of related tables. These relationships are defined by keys in each table and follow patterns called &quot;normal forms&quot;.</p>
<p>We&#39;ll look at the first three normal forms in this video from a conceptual point of view and then we&#39;ll get into the practice in the next video.</p>
', 'Find the Flybys', 11, 301, '652769987', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769987/74a01dbfce', '2023-03-19 09:49:30.306295-07', '2023-03-19 09:49:30.306295-07', 'Normalizing data is all about turning one or more flat files (like CSVs, tab-delimited data, XML or JSON) into a set of related tables. These relationships are defined by keys in each table and follow patterns called normal forms.

We''ll look at the first three normal forms in this video from a conceptual point of view and then we''ll get into the practice in the next video.
', NULL),
(55, 18, 'Narrowing Our Search', 'flybys-inspection', 't', 'Before we can normalize the mission plan data, we need to understand what''s in the table and how it''s related.', '<p>To see a description of a table in Postgres, we use the &quot;describe&quot; command followed by the object we want described: <code>\d csvs.master_plan</code>. </p>
<p>We&#39;re trying to isolate the Enceladus plan data, so for that we can use a simple <code>select</code> statement with a <code>where</code> clause. There&#39;s a lot of data in there and we don&#39;t want it all back, so we can limit the result using <code>limit</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> team, spass_type, target 
<span class=hljs-keyword>from</span> csvs.master_plan 
<span class=hljs-keyword>where</span> target<span class=hljs-operator>=</span><span class=hljs-string>&#x27;Enceladus&#x27;</span> limit <span class=hljs-number>10</span>;
</code></pre>
<p>This equality predicate (<code>where target=&#39;Enceladus&#39;</code>) is case sensitive and very strict - it has to be an exact match. We&#39;d like a more &quot;fuzzy&quot; search, so we can use a matching regular expression in our predicate with the <code>~*</code> operator:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> team, spass_type, target 
<span class=hljs-keyword>from</span> csvs.master_plan 
<span class=hljs-keyword>where</span> target <span class=hljs-operator>~</span><span class=hljs-operator>*</span> <span class=hljs-string>&#x27;Enceladus&#x27;</span> limit <span class=hljs-number>10</span>;
</code></pre>
<p>That&#39;s a case <em>insensitive</em> match. If we wanted a case sensitive matching expression we could use <code>~</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> team, spass_type, target 
<span class=hljs-keyword>from</span> csvs.master_plan 
<span class=hljs-keyword>where</span> target <span class=hljs-operator>~</span> <span class=hljs-string>&#x27;Enceladus&#x27;</span> limit <span class=hljs-number>10</span>;
</code></pre>
<p>Many times you&#39;ll want to isolate the distinct values of a column. This can be to check if there are spelling/casing issues OR to isolate data in order to create a separate table. You can do this using <code>distinct</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> <span class=hljs-keyword>distinct</span> target <span class=hljs-keyword>from</span> csvs.master_plan <span class=hljs-keyword>order</span> <span class=hljs-keyword>by</span> target;
</code></pre>
<p>To figure out how many total records we have matching our <code>where</code> predicate we can use <code>count</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> <span class=hljs-built_in>count</span>(<span class=hljs-number>1</span>) <span class=hljs-keyword>from</span> csvs.master_plan <span class=hljs-keyword>where</span> target <span class=hljs-operator>~</span><span class=hljs-operator>*</span> <span class=hljs-string>&#x27;Enceladus&#x27;</span>;
</code></pre>
<p>You can make your <code>where</code> predicate more exclusive by adding <code>and</code>. This query is using the Postgres case-insensitive &quot;fuzzy&quot; keyword <code>ilike</code>, which accepts a wildcard <code>%</code> that says &quot;show me all the rows where the target is Enceladus and the title starts with the characters <code>flyby</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> start_time_utc, title 
<span class=hljs-keyword>from</span> csvs.master_plan <span class=hljs-keyword>where</span> target<span class=hljs-operator>=</span><span class=hljs-string>&#x27;Enceladus&#x27;</span>
<span class=hljs-keyword>AND</span> title ilike <span class=hljs-string>&#x27;flyby%&#x27;</span>;
</code></pre>
<p>We want something a little more fuzzy, however, because we don&#39;t know if the title will actually <em>start</em> with the term <code>flyby</code> - that means we want something that <em>contains</em> the word <code>flyby</code>. We can, once again, use a regular expression for this, without the wildcard:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> start_time_utc, title 
<span class=hljs-keyword>from</span> csvs.master_plan <span class=hljs-keyword>where</span> target<span class=hljs-operator>=</span><span class=hljs-string>&#x27;Enceladus&#x27;</span>
<span class=hljs-keyword>AND</span> title <span class=hljs-operator>~</span><span class=hljs-operator>*</span> <span class=hljs-string>&#x27;flyby&#x27;</span>;
</code></pre>
', 'Find the Flybys', 12, 281, '652770060', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770060/f1332aac97', '2023-03-19 09:49:30.30712-07', '2023-03-19 09:49:30.30712-07', 'To see a description of a table in Postgres, we use the describe command followed by the object we want described: `\d csvs.master_plan`. 

We''re trying to isolate the Enceladus plan data, so for that we can use a simple `select` statement with a `where` clause. There''s a lot of data in there and we don''t want it all back, so we can limit the result using `limit`:

```sql
select team, spass_type, target 
from csvs.master_plan 
where target=''Enceladus'' limit 10;
```

This equality predicate (`where target=''Enceladus''`) is case sensitive and very strict - it has to be an exact match. We''d like a more fuzzy search, so we can use a matching regular expression in our predicate with the `~*` operator:

```sql
select team, spass_type, target 
from csvs.master_plan 
where target ~* ''Enceladus'' limit 10;
```

That''s a case _insensitive_ match. If we wanted a case sensitive matching expression we could use `~`:

```sql
select team, spass_type, target 
from csvs.master_plan 
where target ~ ''Enceladus'' limit 10;
```

Many times you''ll want to isolate the distinct values of a column. This can be to check if there are spelling/casing issues OR to isolate data in order to create a separate table. You can do this using `distinct`:

```sql
select distinct target from csvs.master_plan order by target;
```

To figure out how many total records we have matching our `where` predicate we can use `count`:

```sql
select count(1) from csvs.master_plan where target ~* ''Enceladus'';
```

You can make your `where` predicate more exclusive by adding `and`. This query is using the Postgres case-insensitive fuzzy keyword `ilike`, which accepts a wildcard `%` that says show me all the rows where the target is Enceladus and the title starts with the characters `flyby`:

```sql
select start_time_utc, title 
from csvs.master_plan where target=''Enceladus''
AND title ilike ''flyby%'';
```

We want something a little more fuzzy, however, because we don''t know if the title will actually _start_ with the term `flyby` - that means we want something that _contains_ the word `flyby`. We can, once again, use a regular expression for this, without the wildcard:

```sql
select start_time_utc, title 
from csvs.master_plan where target=''Enceladus''
AND title ~* ''flyby'';
```', NULL),
(56, 18, 'Isolating the Enceladus Data', 'flybys-isolation', 'f', 'Our inspection showed us how we can isolate the Enceladus data - now let''s do it!', '<p>We&#39;ll start by creating a script to <em>transform</em> the imported data into something we can analyze later on. For that, we&#39;ll use bash:</p>
<pre><code class=language-sh><span class=hljs-built_in>mkdir</span> enceladus <span class=hljs-comment>#if you haven&#x27;t already</span>
<span class=hljs-built_in>touch</span> enceladus/transform.sql
</code></pre>
<p>Once again, we&#39;ll create a schema to work in, but this time we&#39;ll ensure the script is idempotent from the start. As a convenience, we&#39;ll tell Postgres that every bit of SQL that&#39;s to come is to be run in the <code>enceladus</code> schema. We can do that by setting the <code>search_path</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> enceladus cascade;
<span class=hljs-keyword>create</span> schema enceladus;
<span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;
</code></pre>
<p>Creating our <code>teams</code> and <code>plans</code> table, which are related by a <em>foreign key</em>, which is the <code>team_id</code> in the <code>plans</code> table. It <code>references</code> the <code>id</code> of the <code>teams</code> table. We specify that using the keyword <code>references</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> enceladus cascade;
<span class=hljs-keyword>create</span> schema enceladus;
<span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> teams(
  id serial <span class=hljs-keyword>primary</span> key,
  name text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>
);

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> plans(
  id serial <span class=hljs-keyword>primary</span> key,
  <span class=hljs-keyword>start</span> <span class=hljs-type>timestamp</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  title text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  team_id <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>references</span> teams(id),
  description text
);
</code></pre>
<p>Now we need to add some data and we can do that using a new SQL friend, <code>insert</code>. You can <code>insert</code> data in two ways: using the results of a query or by creating a set of hard-coded values. We&#39;ll use a query:</p>
<pre><code class=language-sql><span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> teams(name)
<span class=hljs-keyword>select</span> <span class=hljs-keyword>distinct</span> team <span class=hljs-keyword>from</span> csvs.master_plan;

<span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> plans(<span class=hljs-keyword>start</span>, title, team_id, description)
<span class=hljs-keyword>select</span> 
  start_time_utc::<span class=hljs-type>timestamp</span>,
  title,
  (<span class=hljs-keyword>select</span> id <span class=hljs-keyword>from</span> teams <span class=hljs-keyword>where</span> name<span class=hljs-operator>=</span>csvs.master_plan.team),
  description
<span class=hljs-keyword>from</span> csvs.master_plan
<span class=hljs-keyword>where</span> target<span class=hljs-operator>=</span><span class=hljs-string>&#x27;Enceladus&#x27;</span> <span class=hljs-keyword>and</span> title <span class=hljs-keyword>is</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>;
</code></pre>
', 'Find the Flybys', 13, 349, '652770128', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770128/ddfa1c1fcf', '2023-03-19 09:49:30.309185-07', '2023-03-19 09:49:30.309185-07', 'We''ll start by creating a script to _transform_ the imported data into something we can analyze later on. For that, we''ll use bash:

```sh 
mkdir enceladus #if you haven''t already
touch enceladus/transform.sql
```

Once again, we''ll create a schema to work in, but this time we''ll ensure the script is idempotent from the start. As a convenience, we''ll tell Postgres that every bit of SQL that''s to come is to be run in the `enceladus` schema. We can do that by setting the `search_path`:

```sql 
drop schema if exists enceladus cascade;
create schema enceladus;
set search_path=''enceladus'';
```

Creating our `teams` and `plans` table, which are related by a _foreign key_, which is the `team_id` in the `plans` table. It `references` the `id` of the `teams` table. We specify that using the keyword `references`:

```sql
drop schema if exists enceladus cascade;
create schema enceladus;
set search_path=''enceladus'';

create table teams(
  id serial primary key,
  name text not null
);

create table plans(
  id serial primary key,
  start timestamp not null,
  title text not null,
  team_id int not null references teams(id),
  description text
);
```

Now we need to add some data and we can do that using a new SQL friend, `insert`. You can `insert` data in two ways: using the results of a query or by creating a set of hard-coded values. We''ll use a query:

```sql
insert into teams(name)
select distinct team from csvs.master_plan;

insert into plans(start, title, team_id, description)
select 
  start_time_utc::timestamp,
  title,
  (select id from teams where name=csvs.master_plan.team),
  description
from csvs.master_plan
where target=''Enceladus'' and title is not null;

```', NULL),
(57, 18, 'Creating the Working Set', 'flybys-execution', 'f', 'It''s time to nail down the flybys! We have a plan table full of Enceladus mission plan goodness - now we just need to figure out how to sift the data correctly.', '<p>It might be good to see if the <code>description</code> can tell us something about the closest approach for each flyby. I could use a GUI, but pushing the data out to HTML is more fun:</p>
<pre><code class=language-sh>psql cassini -H -c <span class=hljs-string>&quot;select * from enceladus.plans where title ~* &#x27;flyby&#x27;&quot;</span>  &gt; flybys.html &amp;&amp; open flybys.html
</code></pre>
<p>Flybys, as far as we&#39;re concerned, are the set of dates when Cassini flew closest to Enceladus. We can, once again, use <code>distinct</code> on our timestamp field, this time casting it as a <code>date</code> first. We&#39;re also meeting a new SQL friend - <code>order by</code>! This will sort the data for us in ascending fashion. If we append <code>desc</code> on the end of the statement, it will sort in descending fashion:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> <span class=hljs-keyword>distinct</span> <span class=hljs-keyword>start</span>::<span class=hljs-type>date</span> 
<span class=hljs-keyword>from</span> enceladus.plans 
<span class=hljs-keyword>where</span> title <span class=hljs-operator>~</span><span class=hljs-operator>*</span> <span class=hljs-string>&#x27;flyby&#x27;</span> 
<span class=hljs-keyword>order</span> <span class=hljs-keyword>by</span> <span class=hljs-keyword>start</span>::<span class=hljs-type>date</span>;
</code></pre>
<p>Our results from the mission plan table proved useless :( and this happens sometimes. We ended up scraping a website, which is OK if that website is nasa.gov and we can <a href=https://solarsystem.nasa.gov/missions/cassini/mission/tour/flybys/?page=0&per_page=40&order=publish_date+desc%2Ccreated_at+desc&search=Enceladus&tags=cassini%3Aflybys>hack the querystring</a>. For this, inserting the raw values by hand will suffice and for that we meet another new SQL friend: <code>insert values</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> enceladus cascade;
<span class=hljs-keyword>create</span> schema enceladus;
<span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> flybys(
  id serial <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>primary</span> key,
  name text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  <span class=hljs-type>date</span> <span class=hljs-type>date</span>
);
<span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> flybys(name, <span class=hljs-type>date</span>)
<span class=hljs-keyword>values</span> (<span class=hljs-string>&#x27;E-0&#x27;</span>, <span class=hljs-string>&#x27;2005-02-17&#x27;</span>),
(<span class=hljs-string>&#x27;E-1&#x27;</span>, <span class=hljs-string>&#x27;2005-03-09&#x27;</span>),(<span class=hljs-string>&#x27;E-2&#x27;</span>, <span class=hljs-string>&#x27;2005-07-14&#x27;</span>),
(<span class=hljs-string>&#x27;E-3&#x27;</span>, <span class=hljs-string>&#x27;2008-03-12&#x27;</span>),(<span class=hljs-string>&#x27;E-4&#x27;</span>, <span class=hljs-string>&#x27;2008-08-11&#x27;</span>),
(<span class=hljs-string>&#x27;E-5&#x27;</span>, <span class=hljs-string>&#x27;2008-10-09&#x27;</span>),(<span class=hljs-string>&#x27;E-6&#x27;</span>, <span class=hljs-string>&#x27;2008-10-31&#x27;</span>),
(<span class=hljs-string>&#x27;E-7&#x27;</span>, <span class=hljs-string>&#x27;2009-11-02&#x27;</span>),(<span class=hljs-string>&#x27;E-8&#x27;</span>, <span class=hljs-string>&#x27;2009-11-21&#x27;</span>),
(<span class=hljs-string>&#x27;E-9&#x27;</span>, <span class=hljs-string>&#x27;2010-04-28&#x27;</span>),(<span class=hljs-string>&#x27;E-10&#x27;</span>, <span class=hljs-string>&#x27;2010-05-18&#x27;</span>),
(<span class=hljs-string>&#x27;E-11&#x27;</span>, <span class=hljs-string>&#x27;2010-08-13&#x27;</span>),(<span class=hljs-string>&#x27;E-12&#x27;</span>, <span class=hljs-string>&#x27;2010-11-30&#x27;</span>),
(<span class=hljs-string>&#x27;E-13&#x27;</span>, <span class=hljs-string>&#x27;2010-12-21&#x27;</span>),(<span class=hljs-string>&#x27;E-14&#x27;</span>, <span class=hljs-string>&#x27;2011-10-01&#x27;</span>),
(<span class=hljs-string>&#x27;E-15&#x27;</span>, <span class=hljs-string>&#x27;2011-10-19&#x27;</span>),(<span class=hljs-string>&#x27;E-16&#x27;</span>, <span class=hljs-string>&#x27;2011-11-06&#x27;</span>),
(<span class=hljs-string>&#x27;E-17&#x27;</span>, <span class=hljs-string>&#x27;2012-03-27&#x27;</span>),(<span class=hljs-string>&#x27;E-18&#x27;</span>, <span class=hljs-string>&#x27;2012-04-14&#x27;</span>),
(<span class=hljs-string>&#x27;E-19&#x27;</span>, <span class=hljs-string>&#x27;2012-05-02&#x27;</span>),(<span class=hljs-string>&#x27;E-20&#x27;</span>, <span class=hljs-string>&#x27;2015-10-14&#x27;</span>),
(<span class=hljs-string>&#x27;E-21&#x27;</span>, <span class=hljs-string>&#x27;2015-10-28&#x27;</span>),(<span class=hljs-string>&#x27;E-22&#x27;</span>, <span class=hljs-string>&#x27;2015-12-19&#x27;</span>);
</code></pre>
', 'Find the Flybys', 14, 371, '652770230', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770230/87e6eabc0a', '2023-03-19 09:49:30.311263-07', '2023-03-19 09:49:30.311263-07', 'It might be good to see if the `description` can tell us something about the closest approach for each flyby. I could use a GUI, but pushing the data out to HTML is more fun:

```sh
psql cassini -H -c select * from enceladus.plans where title ~* ''flyby''  > flybys.html && open flybys.html
```

Flybys, as far as we''re concerned, are the set of dates when Cassini flew closest to Enceladus. We can, once again, use `distinct` on our timestamp field, this time casting it as a `date` first. We''re also meeting a new SQL friend - `order by`! This will sort the data for us in ascending fashion. If we append `desc` on the end of the statement, it will sort in descending fashion:

```sql 
select distinct start::date 
from enceladus.plans 
where title ~* ''flyby'' 
order by start::date;
```

Our results from the mission plan table proved useless :( and this happens sometimes. We ended up scraping a website, which is OK if that website is nasa.gov and we can [hack the querystring](https://solarsystem.nasa.gov/missions/cassini/mission/tour/flybys/?page=0&per_page=40&order=publish_date+desc%2Ccreated_at+desc&search=Enceladus&tags=cassini%3Aflybys). For this, inserting the raw values by hand will suffice and for that we meet another new SQL friend: `insert values`:

```sql 
drop schema if exists enceladus cascade;
create schema enceladus;
set search_path=''enceladus'';

create table flybys(
  id serial not null primary key,
  name text not null,
  date date
);
insert into flybys(name, date)
values (''E-0'', ''2005-02-17''),
(''E-1'', ''2005-03-09''),(''E-2'', ''2005-07-14''),
(''E-3'', ''2008-03-12''),(''E-4'', ''2008-08-11''),
(''E-5'', ''2008-10-09''),(''E-6'', ''2008-10-31''),
(''E-7'', ''2009-11-02''),(''E-8'', ''2009-11-21''),
(''E-9'', ''2010-04-28''),(''E-10'', ''2010-05-18''),
(''E-11'', ''2010-08-13''),(''E-12'', ''2010-11-30''),
(''E-13'', ''2010-12-21''),(''E-14'', ''2011-10-01''),
(''E-15'', ''2011-10-19''),(''E-16'', ''2011-11-06''),
(''E-17'', ''2012-03-27''),(''E-18'', ''2012-04-14''),
(''E-19'', ''2012-05-02''),(''E-20'', ''2015-10-14''),
(''E-21'', ''2015-10-28''),(''E-22'', ''2015-12-19'');
```', NULL),
(58, 18, 'Summary of Flyby Work', 'flybys-summary', 'f', 'We learned a few wonderful things in this section - one of the biggest, to me, is that our job is more than running queries - it''s also digging in to the data we have and ensuring that it''s usable.', '<p>Sometimes invalidating a set of data is just as important as validating it. Unfortunately, it means we&#39;ll often lose HOURS of work, which can suck.</p>
', 'Find the Flybys', 15, 99, '652770342', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770342/9a5ccd6a44', '2023-03-19 09:49:30.318027-07', '2023-03-19 09:49:30.318027-07', 'Sometimes invalidating a set of data is just as important as validating it. Unfortunately, it means we''ll often lose HOURS of work, which can suck.', NULL),
(59, 18, 'Introducing the INMS', 'setup-inms', 'f', 'The fun begins! We have the data we need isolated and we feel good about its integrity - now we''re ready to let it tell us a story. But what story is that? This is where things get interesting.', '<p>Learning SQL is useful, but not without context. Is it possible to create a compelling web page by learning JavaScript and NOT understanding the Document Object Model? I don&#39;t think so. In the same way: you can&#39;t &quot;just learn SQL&quot; without understanding the data you&#39;re working with.</p>
<p>As opposed to working with a DVD rental application - we&#39;re going to dig into some rad space data!</p>
', 'INMS Data Import', 16, 240, '652770373', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770373/94480dc84e', '2023-03-19 09:49:30.319867-07', '2023-03-19 09:49:30.319867-07', 'Learning SQL is useful, but not without context. Is it possible to create a compelling web page by learning JavaScript and NOT understanding the Document Object Model? I don''t think so. In the same way: you can''t just learn SQL without understanding the data you''re working with.

As opposed to working with a DVD rental application - we''re going to dig into some rad space data!', NULL),
(60, 18, 'Extracting and Loading the INMS Data', 'extract-load', 'f', 'We''ve done this all before so let''s get rolling! The first thing we''re going to do is to load up the INMS and chemical data into Postgres.', '<p>We&#39;ll update our <code>import.sql</code> file since we don&#39;t need the <code>master_plan</code> data any more. Here&#39;s the entire query:</p>
<pre><code class=language-sql> <span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> csvs cascade;
 <span class=hljs-keyword>create</span> schema csvs;
 <span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> csvs.inms(
  sclk text,
  uttime text,
  target text,
  time_ca text,
  targ_pos_x text,
  targ_pos_y text,
  targ_pos_z text,
  source text,
  data_reliability text,
  table_set_id text,
  coadd_cnt text,
  osp_fil_1_status text,
  oss_fil_2_status text,
  csp_fil_3_status text,
  css_fil_4_status text,
  seq_table text,
  cyc_num text,
  cyc_table text,
  scan_num text,
  trap_table text,
  sw_table text,
  mass_table text,
  focus_table text,
  da_table text,
  velocity_comp text,
  ipnum text,
  mass_per_charge text,
  os_lens2 text,
  os_lens1 text,
  os_lens4 text,
  os_lens3 text,
  qp_lens2 text,
  qp_lens1 text,
  qp_lens4 text,
  qp_lens3 text,
  qp_bias text,
  ion_defl2 text,
  ion_defl1 text,
  ion_defl4 text,
  ion_defl3 text,
  top_plate text,
  p_energy text,
  alt_t text,
  view_dir_t_x text,
  view_dir_t_y text,
  view_dir_t_z text,
  sc_pos_t_x text,
  sc_pos_t_y text,
  sc_pos_t_z text,
  sc_vel_t_x text,
  sc_vel_t_y text,
  sc_vel_t_z text,
  sc_vel_t_scx text,
  sc_vel_t_scy text,
  sc_vel_t_scz text,
  lst_t text,
  sza_t text,
  ss_long_t text,
  distance_s text,
  view_dir_s_x text,
  view_dir_s_y text,
  view_dir_s_z text,
  sc_pos_s_x text,
  sc_pos_s_y text,
  sc_pos_s_z text,
  sc_vel_s_x text,
  sc_vel_s_y text,
  sc_vel_s_z text,
  lst_s text,
  sza_s text,
  ss_long_s text,
  sc_att_angle_ra text,
  sc_att_angle_dec text,
  sc_att_angle_tw text,
  c1counts text,
  c2counts text
 );
 <span class=hljs-keyword>copy</span> csvs.inms 
 <span class=hljs-keyword>from</span> <span class=hljs-string>&#x27;[Absolute Path To]/cassini/csvs/inms.csv&#x27;</span>
 delimiter <span class=hljs-string>&#x27;,&#x27;</span> header csv;
 <span class=hljs-comment>-- the header rows are included in the concatenated set</span>
 <span class=hljs-comment>-- removing</span>
 <span class=hljs-keyword>delete</span> <span class=hljs-keyword>from</span> csvs.inms <span class=hljs-keyword>where</span> sclk<span class=hljs-operator>=</span><span class=hljs-string>&#x27;sclk&#x27;</span> <span class=hljs-keyword>or</span> sclk <span class=hljs-keyword>is</span> <span class=hljs-keyword>null</span>;
</code></pre>
', 'INMS Data Import', 17, 201, '652770528', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770528/085bb8566f', '2023-03-19 09:49:30.321055-07', '2023-03-19 09:49:30.321055-07', 'We''ll update our `import.sql` file since we don''t need the `master_plan` data any more. Here''s the entire query:

```sql 
 drop schema if exists csvs cascade;
 create schema csvs;
 create table csvs.inms(
  sclk text,
  uttime text,
  target text,
  time_ca text,
  targ_pos_x text,
  targ_pos_y text,
  targ_pos_z text,
  source text,
  data_reliability text,
  table_set_id text,
  coadd_cnt text,
  osp_fil_1_status text,
  oss_fil_2_status text,
  csp_fil_3_status text,
  css_fil_4_status text,
  seq_table text,
  cyc_num text,
  cyc_table text,
  scan_num text,
  trap_table text,
  sw_table text,
  mass_table text,
  focus_table text,
  da_table text,
  velocity_comp text,
  ipnum text,
  mass_per_charge text,
  os_lens2 text,
  os_lens1 text,
  os_lens4 text,
  os_lens3 text,
  qp_lens2 text,
  qp_lens1 text,
  qp_lens4 text,
  qp_lens3 text,
  qp_bias text,
  ion_defl2 text,
  ion_defl1 text,
  ion_defl4 text,
  ion_defl3 text,
  top_plate text,
  p_energy text,
  alt_t text,
  view_dir_t_x text,
  view_dir_t_y text,
  view_dir_t_z text,
  sc_pos_t_x text,
  sc_pos_t_y text,
  sc_pos_t_z text,
  sc_vel_t_x text,
  sc_vel_t_y text,
  sc_vel_t_z text,
  sc_vel_t_scx text,
  sc_vel_t_scy text,
  sc_vel_t_scz text,
  lst_t text,
  sza_t text,
  ss_long_t text,
  distance_s text,
  view_dir_s_x text,
  view_dir_s_y text,
  view_dir_s_z text,
  sc_pos_s_x text,
  sc_pos_s_y text,
  sc_pos_s_z text,
  sc_vel_s_x text,
  sc_vel_s_y text,
  sc_vel_s_z text,
  lst_s text,
  sza_s text,
  ss_long_s text,
  sc_att_angle_ra text,
  sc_att_angle_dec text,
  sc_att_angle_tw text,
  c1counts text,
  c2counts text
 );
 copy csvs.inms 
 from ''[Absolute Path To]/cassini/csvs/inms.csv''
 delimiter '','' header csv;
 -- the header rows are included in the concatenated set
 -- removing
 delete from csvs.inms where sclk=''sclk'' or sclk is null;
 ```', NULL),
(61, 18, 'Transformation, Part 1', 'loading-1', 'f', 'The INMS CSV is loaded, now we need to create our analysis table using the full power of PostgreSQL - specifically strong data types with appropriate constraints.', '<p>Transforming CSVs (aka &quot;text flat files&quot;) into relational data is both challenging and fun. Let&#39;s impose some typing and rules for the incoming data so that we can rely on it in our analysis:</p>
<pre><code class=language-sql><span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> enceladus cascade;
<span class=hljs-keyword>create</span> schema enceladus;

<span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;
<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> inms(
  id bigserial <span class=hljs-keyword>primary</span> key,
  created_at <span class=hljs-type>timestamp</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  altitude <span class=hljs-type>numeric</span>(<span class=hljs-number>9</span>,<span class=hljs-number>2</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(altitude <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  source text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(source <span class=hljs-keyword>in</span>(<span class=hljs-string>&#x27;osi&#x27;</span>,<span class=hljs-string>&#x27;csn&#x27;</span>,<span class=hljs-string>&#x27;osnb&#x27;</span>,<span class=hljs-string>&#x27;osnt&#x27;</span>))
  mass <span class=hljs-type>numeric</span>(<span class=hljs-number>6</span>,<span class=hljs-number>3</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(mass <span class=hljs-operator>&gt;=</span><span class=hljs-number>0.125</span> <span class=hljs-keyword>and</span> mass <span class=hljs-operator>&lt;</span> <span class=hljs-number>100</span>),
  high_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(high_sensitivity_count <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  low_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(low_sensitivity_count <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>)
);
</code></pre>
<p>Does this look overwhelming to you? That&#39;s OK - in the next video we&#39;re going to break things down a bit.</p>
', 'INMS Data Import', 18, 120, '652770607', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770607/1d200f46d4', '2023-03-19 09:49:30.322223-07', '2023-03-19 09:49:30.322223-07', 'Transforming CSVs (aka text flat files) into relational data is both challenging and fun. Let''s impose some typing and rules for the incoming data so that we can rely on it in our analysis:

```sql
drop schema if exists enceladus cascade;
create schema enceladus;

set search_path=''enceladus'';
create table inms(
  id bigserial primary key,
  created_at timestamp not null,
  altitude numeric(9,2) not null check(altitude > 0),
  source text not null check(source in(''osi'',''csn'',''osnb'',''osnt''))
  mass numeric(6,3) not null check(mass >=0.125 and mass < 100),
  high_sensitivity_count int not null check(high_sensitivity_count > 0),
  low_sensitivity_count int not null check(low_sensitivity_count > 0)
);
```

Does this look overwhelming to you? That''s OK - in the next video we''re going to break things down a bit.', NULL),
(62, 18, 'Concept: Constraints', 'constraints', 't', 'We''ve been moving along at a pretty fast clip and it''s crucial that we don''t go too fast, skimming over super important concepts like constraints!', '<p>We have a number of constraints on our table and we really should understand what they do at a deeper level. In this video we&#39;ll dive into the constraint code below.</p>
<pre><code class=language-sql><span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> inms(
  id bigserial <span class=hljs-keyword>primary</span> key,
  created_at <span class=hljs-type>timestamp</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  altitude <span class=hljs-type>numeric</span>(<span class=hljs-number>9</span>,<span class=hljs-number>2</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(altitude <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  source text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(source <span class=hljs-keyword>in</span>(<span class=hljs-string>&#x27;osi&#x27;</span>,<span class=hljs-string>&#x27;csn&#x27;</span>,<span class=hljs-string>&#x27;osnb&#x27;</span>,<span class=hljs-string>&#x27;osnt&#x27;</span>))
  mass <span class=hljs-type>numeric</span>(<span class=hljs-number>6</span>,<span class=hljs-number>3</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(mass <span class=hljs-operator>&gt;=</span><span class=hljs-number>0.125</span> <span class=hljs-keyword>and</span> mass <span class=hljs-operator>&lt;</span> <span class=hljs-number>100</span>),
  high_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(high_sensitivity_count <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  low_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(low_sensitivity_count <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>)
);
</code></pre>
', 'INMS Data Import', 19, 416, '652770850', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770850/b60e0dc590', '2023-03-19 09:49:30.323233-07', '2023-03-19 09:49:30.323233-07', 'We have a number of constraints on our table and we really should understand what they do at a deeper level. In this video we''ll dive into the constraint code below.

```sql
create table inms(
  id bigserial primary key,
  created_at timestamp not null,
  altitude numeric(9,2) not null check(altitude > 0),
  source text not null check(source in(''osi'',''csn'',''osnb'',''osnt''))
  mass numeric(6,3) not null check(mass >=0.125 and mass < 100),
  high_sensitivity_count int not null check(high_sensitivity_count > 0),
  low_sensitivity_count int not null check(low_sensitivity_count > 0)
);
```
', NULL),
(63, 18, 'Installing PostgreSQL', 'setup-postgres', 'f', 'We''ll be using PostgreSQL for our SQL and analysis tasks. You can use other systems and they work just fine - but for this one we''ll be using PostgreSQL. We have a bunch of data to load up and poke through, so let''s get rolling quickly OK?', '', 'Introduction', 2, 270, '652768012', NULL, '8c21245c2bc90ed8a62b7c18ed815180', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652768012/cd13898523', '2023-03-19 09:49:30.325007-07', '2023-03-19 09:49:30.325007-07', 'There are numerous ways to get a PostgreSQL server up and running - the easiest is usually your best choice!

I like to run Postgres locally, so I typically run [Postgres.app](https://postgresapp.com) because I''m working on a Mac. It''s very flexible and is a drag/drop install.

You can also work with Docker if you like, but beware that you might run low on resources later in the course as we dive into millllllions of records. Here''s a docker-compose file for you to get started with:

```yml
version: 3
services:
  postgres:
    image: postgres:13.3
    environment:
      - POSTGRES_USER=dee
      - POSTGRES_PASSWORD=deedle
      - POSTGRES_DB=cassini
    ports:
      - 8088:5432
    volumes:
      - ./data/pg:/var/lib/postgresql/data
      - ./csvs:/home
    container_name: pg
  pgweb:
    container_name: pgweb
    restart: always
    image: sosedoff/pgweb
    ports:
      - 8080:8081
    links:
      - postgres:postgres
    environment:
      - DATABASE_URL=postgres://dee:deedle@postgres:5432/cassini?sslmode=disable
    depends_on:
      - postgres
```

Here are some fun aliases for you to pop into your `.env` file if you have a plugin that will auto load them into your shell:

```sh 
alias up=docker-compose up
alias down=docker-compose down
alias in=docker exec -it pg /bin/bash
```

If you''re on Windows, it''s probably easiest to [download Postgres](https://www.postgresql.org/download/windows/) and run it as a service.

## Clients

We''ll be using the the shell for most of our work, but at times you might want to be working in a GUI. If you run the docker bits above, a GUI is there for you and should be running on port 8080 when you `docker-compose-up`. 

I like [Postico](https://eggerapps.at/postico/) and have paid the $35 happily. It''s Mac-only, so if you''re on Windows I would encourage you to download the [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15).
', NULL),
(64, 18, 'Transformation, Part 2', 'loading-2', 'f', 'Now that we understand constraints a little bit more, let''s carry on and buff this table out completely. We''ll add a timestamp with time zone so we know when the import happened and then we''ll get into some weird stuff with generated columns!', '<p>Timestamping when data has been created or updated is a regular occurrence in the developer world and if you&#39;re working with Postgres, the definition is simple:</p>
<pre><code class=language-sql><span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> products(
  <span class=hljs-comment>--...</span>
  created_at timestamptz <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>default</span> now(),
  updated_at timestamptz <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>default</span> now()
);
</code></pre>
<p>When preparing data for analysis, it&#39;s common to denormalize it in order to speed up the analysis process. It&#39;s common to see data <em>pre-calculated</em> and stored, especially if its historical data like ours is. I&#39;m doing exactly this by creating a <code>date</code> and <code>year</code> field. </p>
<p>Postgres makes this kind of thing simple by offering <code>generated</code> fields:</p>
<pre><code class=language-sql><span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> inms(
  id serial <span class=hljs-keyword>primary</span> key,
  created_at <span class=hljs-type>timestamp</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  <span class=hljs-type>date</span> <span class=hljs-type>date</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> generated always <span class=hljs-keyword>as</span> (created_at::<span class=hljs-type>date</span>) stored,
  <span class=hljs-keyword>year</span> <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> generated always <span class=hljs-keyword>as</span> (date_part(<span class=hljs-string>&#x27;year&#x27;</span>, created_at)) stored,
  <span class=hljs-comment>--...</span>
);
</code></pre>
<p>Whenever the <code>created_at</code> data changes, so will <code>date</code> and <code>year</code> because these are <em>virtual</em> columns that can&#39;t be changed directly.</p>
<p>Here&#39;s the entire table definition:</p>
<pre><code class=language-sql><span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> enceladus cascade;
<span class=hljs-keyword>create</span> schema enceladus;
<span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> inms(
  id serial <span class=hljs-keyword>primary</span> key,
  created_at <span class=hljs-type>timestamp</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  <span class=hljs-type>date</span> <span class=hljs-type>date</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> generated always <span class=hljs-keyword>as</span> (created_at::<span class=hljs-type>date</span>) stored,
  <span class=hljs-keyword>year</span> <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> generated always <span class=hljs-keyword>as</span> (date_part(<span class=hljs-string>&#x27;year&#x27;</span>, created_at)) stored,
  flyby_id <span class=hljs-type>int</span> <span class=hljs-keyword>references</span> flybys(id),
  altitude <span class=hljs-type>numeric</span>(<span class=hljs-number>9</span>,<span class=hljs-number>2</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(altitude <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  source text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(source <span class=hljs-keyword>in</span>(<span class=hljs-string>&#x27;osi&#x27;</span>,<span class=hljs-string>&#x27;csn&#x27;</span>,<span class=hljs-string>&#x27;osnb&#x27;</span>,<span class=hljs-string>&#x27;osnt&#x27;</span>)),
  mass <span class=hljs-type>numeric</span>(<span class=hljs-number>6</span>,<span class=hljs-number>3</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(mass <span class=hljs-operator>&gt;=</span><span class=hljs-number>0.125</span> <span class=hljs-keyword>and</span> mass <span class=hljs-operator>&lt;</span> <span class=hljs-number>100</span>),
  high_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(high_sensitivity_count <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  low_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(low_sensitivity_count <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  imported_at timestamptz <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>default</span> now()
);
</code></pre>
<p>To insert data into this table we need to execute an <code>insert</code> statement (which is going to fail, but that&#39;s OK it&#39;s kind of in the plan). Notice that I don&#39;t need to insert <em>all</em> of the fields - the generated bits take care of themselves, as does the <code>imported_at</code> timestamp due to its default:</p>
<pre><code class=language-sql><span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> inms(
  created_at, 
  altitude, 
  source, 
  mass, 
  high_sensitivity_count,
  low_sensitivity_count
)
<span class=hljs-keyword>select</span>
  sclk::<span class=hljs-type>timestamp</span>,
  alt_t::<span class=hljs-type>numeric</span>(<span class=hljs-number>9</span>,<span class=hljs-number>2</span>),
  source,
  mass_per_charge::<span class=hljs-type>numeric</span>(<span class=hljs-number>6</span>,<span class=hljs-number>3</span>),
  c1counts::<span class=hljs-type>int</span>,
  c1counts::<span class=hljs-type>int</span>
<span class=hljs-keyword>from</span> csvs.inms
<span class=hljs-keyword>where</span> target<span class=hljs-operator>=</span><span class=hljs-string>&#x27;ENCELADUS&#x27;</span>;
</code></pre>
', 'INMS Data Import', 20, 464, '652770658', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652770658/010810be78', '2023-03-19 09:49:30.326247-07', '2023-03-19 09:49:30.326247-07', 'Timestamping when data has been created or updated is a regular occurrence in the developer world and if you''re working with Postgres, the definition is simple:

```sql
create table products(
  --...
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
```

When preparing data for analysis, it''s common to denormalize it in order to speed up the analysis process. It''s common to see data _pre-calculated_ and stored, especially if its historical data like ours is. I''m doing exactly this by creating a `date` and `year` field. 

Postgres makes this kind of thing simple by offering `generated` fields:

```sql 
create table inms(
  id serial primary key,
  created_at timestamp not null,
  date date not null generated always as (created_at::date) stored,
  year int not null generated always as (date_part(''year'', created_at)) stored,
  --...
);
```

Whenever the `created_at` data changes, so will `date` and `year` because these are _virtual_ columns that can''t be changed directly.

Here''s the entire table definition:

```sql 
drop schema if exists enceladus cascade;
create schema enceladus;
set search_path=''enceladus'';

create table inms(
  id serial primary key,
  created_at timestamp not null,
  date date not null generated always as (created_at::date) stored,
  year int not null generated always as (date_part(''year'', created_at)) stored,
  flyby_id int references flybys(id),
  altitude numeric(9,2) not null check(altitude > 0),
  source text not null check(source in(''osi'',''csn'',''osnb'',''osnt'')),
  mass numeric(6,3) not null check(mass >=0.125 and mass < 100),
  high_sensitivity_count int not null check(high_sensitivity_count > 0),
  low_sensitivity_count int not null check(low_sensitivity_count > 0),
  imported_at timestamptz not null default now()
);
```

To insert data into this table we need to execute an `insert` statement (which is going to fail, but that''s OK it''s kind of in the plan). Notice that I don''t need to insert _all_ of the fields - the generated bits take care of themselves, as does the `imported_at` timestamp due to its default:

```sql 
insert into inms(
  created_at, 
  altitude, 
  source, 
  mass, 
  high_sensitivity_count,
  low_sensitivity_count
)
select
  sclk::timestamp,
  alt_t::numeric(9,2),
  source,
  mass_per_charge::numeric(6,3),
  c1counts::int,
  c1counts::int
from csvs.inms
where target=''ENCELADUS'';
```', NULL),
(65, 18, 'Troubleshooting', 'troubleshooting', 'f', 'Wouldn''t be any fun if we did everything right the first time, would it? Imposing rules during transformation is always problematic - which is great! We get to learn about our assumptions and also dig deeper into the data.', '<p>I&#39;ve never created a transformation/import script that worked right the first time - which makes me happy! These scripts reflect your assumptions and understanding of your data and if you&#39;ve goofed up, you&#39;ll know!</p>
<p>Here&#39;s the final, fixed script:</p>
<pre><code class=language-sql><span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> enceladus cascade;
<span class=hljs-keyword>create</span> schema enceladus;
<span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> inms(
  id serial <span class=hljs-keyword>primary</span> key,
  created_at <span class=hljs-type>timestamp</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  <span class=hljs-type>date</span> <span class=hljs-type>date</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> generated always <span class=hljs-keyword>as</span> (created_at::<span class=hljs-type>date</span>) stored,
  <span class=hljs-keyword>year</span> <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> generated always <span class=hljs-keyword>as</span> (date_part(<span class=hljs-string>&#x27;year&#x27;</span>, created_at)) stored,
  flyby_id <span class=hljs-type>int</span> <span class=hljs-keyword>references</span> flybys(id),
  altitude <span class=hljs-type>numeric</span>(<span class=hljs-number>9</span>,<span class=hljs-number>2</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(altitude <span class=hljs-operator>&gt;</span> <span class=hljs-number>0</span>),
  source text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(source <span class=hljs-keyword>in</span>(<span class=hljs-string>&#x27;osi&#x27;</span>,<span class=hljs-string>&#x27;csn&#x27;</span>,<span class=hljs-string>&#x27;osnb&#x27;</span>,<span class=hljs-string>&#x27;esm&#x27;</span>)),
  mass <span class=hljs-type>numeric</span>(<span class=hljs-number>6</span>,<span class=hljs-number>3</span>) <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(mass <span class=hljs-operator>&gt;=</span><span class=hljs-number>0.125</span> <span class=hljs-keyword>and</span> mass <span class=hljs-operator>&lt;</span> <span class=hljs-number>256</span>),
  high_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(high_sensitivity_count <span class=hljs-operator>&gt;=</span> <span class=hljs-number>0</span>),
  low_sensitivity_count <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>check</span>(low_sensitivity_count <span class=hljs-operator>&gt;=</span> <span class=hljs-number>0</span>),
  imported_at timestamptz <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>default</span> now()
);

<span class=hljs-keyword>update</span> inms
<span class=hljs-keyword>set</span> flyby_id <span class=hljs-operator>=</span> flybys.id
<span class=hljs-keyword>from</span> flybys 
<span class=hljs-keyword>where</span> flybys.date <span class=hljs-operator>=</span> inms.date;

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> chemistry(
  id serial <span class=hljs-keyword>primary</span> key,
  name text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  formula text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  molecular_weight <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  peak <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>
);

<span class=hljs-keyword>copy</span> chemistry(name, formula,molecular_weight, peak) 
<span class=hljs-keyword>from</span> <span class=hljs-string>&#x27;[Absolute path to]/csvs/chem_data.csv&#x27;</span>
<span class=hljs-keyword>with</span> delimiter <span class=hljs-string>&#x27;,&#x27;</span> header csv;
</code></pre>
', 'INMS Data Import', 21, 663, '652771022', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652771022/848d3029b7', '2023-03-19 09:49:30.334464-07', '2023-03-19 09:49:30.334464-07', 'I''ve never created a transformation/import script that worked right the first time - which makes me happy! These scripts reflect your assumptions and understanding of your data and if you''ve goofed up, you''ll know!

Here''s the final, fixed script:

```sql
drop schema if exists enceladus cascade;
create schema enceladus;
set search_path=''enceladus'';

create table inms(
  id serial primary key,
  created_at timestamp not null,
  date date not null generated always as (created_at::date) stored,
  year int not null generated always as (date_part(''year'', created_at)) stored,
  flyby_id int references flybys(id),
  altitude numeric(9,2) not null check(altitude > 0),
  source text not null check(source in(''osi'',''csn'',''osnb'',''esm'')),
  mass numeric(6,3) not null check(mass >=0.125 and mass < 256),
  high_sensitivity_count int not null check(high_sensitivity_count >= 0),
  low_sensitivity_count int not null check(low_sensitivity_count >= 0),
  imported_at timestamptz not null default now()
);

update inms
set flyby_id = flybys.id
from flybys 
where flybys.date = inms.date;

create table chemistry(
  id serial primary key,
  name text not null,
  formula text not null,
  molecular_weight int not null,
  peak int not null
);

copy chemistry(name, formula,molecular_weight, peak) 
from ''[Absolute path to]/csvs/chem_data.csv''
with delimiter '','' header csv;
```
', NULL),
(66, 18, 'INMS Loading Summary', 'inms-summary', 'f', 'That was fun work! We learned a lot of fun concepts and some new SQL!', '<p>We learned some new SQL and expanded on some old friends. We learned how to update a set of rows using values from a different table. We also learned how to delete troublesome data using delete from. We touched briefly on analytical functions that we&#39;ll be using more in the next section. We got into trouble using check constraints but also learned they can help us sleep soundly at night. We had some fun using generated columns and saved ourselves some time later on by denormalizing (sort of) our table. And finally we learned about range queries using IN, a very popular way to find intersecting records.</p>
<p>Hope you&#39;re feeling the SQL love!</p>
', 'INMS Data Import', 22, 88, '652771271', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652771271/bd7d92a0ba', '2023-03-19 09:49:30.336853-07', '2023-03-19 09:49:30.336853-07', 'We learned some new SQL and expanded on some old friends. We learned how to update a set of rows using values from a different table. We also learned how to delete troublesome data using delete from. We touched briefly on analytical functions that we''ll be using more in the next section. We got into trouble using check constraints but also learned they can help us sleep soundly at night. We had some fun using generated columns and saved ourselves some time later on by denormalizing (sort of) our table. And finally we learned about range queries using IN, a very popular way to find intersecting records.

Hope you''re feeling the SQL love!
', NULL),
(67, 18, 'Understanding What We''re Looking For', 'context', 'f', 'The fun begins! We have the data we need isolated and we feel good about its integrity - now we''re ready to let it tell us a story. But what story is that? This is where things get interesting.', '<p>The key to &quot;good data work&quot; is, to the best of your ability, avoid imposing your <em>bias</em> on the process. I propose that this isn&#39;t possible given that we need to make choices about the data at almost every step.</p>
<p>This is especially true with analysis! We have a groovy set of data - but why do we have it? What are we supposed to do? We know that scientists are interested in the possibility of life under the ice of Enceladus, but what data supports this idea or invalidates it?</p>
<p>To do our jobs, we need to understand the data better and hold tightly to the mantra that <strong>the story is in the data</strong>. It&#39;s not in our heads or in anyone&#39;s opinion - we need to let the data speak to us.</p>
', 'Analysis', 23, 318, '652771324', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652771324/4dde6dbb30', '2023-03-19 09:49:30.338141-07', '2023-03-19 09:49:30.338141-07', 'The key to good data work is, to the best of your ability, avoid imposing your _bias_ on the process. I propose that this isn''t possible given that we need to make choices about the data at almost every step.

This is especially true with analysis! We have a groovy set of data - but why do we have it? What are we supposed to do? We know that scientists are interested in the possibility of life under the ice of Enceladus, but what data supports this idea or invalidates it?

To do our jobs, we need to understand the data better and hold tightly to the mantra that **the story is in the data**. It''s not in our heads or in anyone''s opinion - we need to let the data speak to us.', NULL),
(68, 18, 'Concept: Joins', 'joins', 'f', 'Bias can creep in anywhere during the analysis process - even in the way you structure your query and the joins you use.', '<p>The word <em>bias</em> might sound a bit strong when describing the use of joins. It&#39;s important to note, however, that bias can take two forms: <em>implicit</em> and <em>explicit</em>. I dislike brussel sprouts and will never eat them (unless they&#39;re wrapped in bacon and then they&#39;re tolerable). This is an <em>explicit</em> bias and I know it!</p>
<p>Implicit bias can take many forms that we&#39;re simply not aware of, including a lack of knowledge or experience. It also takes the form of unseen preferences which, in the programming world can come down to the languages you use, the editors you write in and even the music you listen to while writing that code in that editor!</p>
<p>We&#39;re going to see how implicit bias can change the story our data tells. It will seem subtle - but that&#39;s exactly the point...</p>
<h2 id=left-right-full-outer-joins>Left, Right, Full Outer Joins</h2>
<p>In this example we work with a <em>many to many</em> join. One person can have many jobs, and one job can have many people. Notice the composite primary key on <code>assignments</code>. This is a common primary key for joining tables. The primary key is defined by two columns instead of one, the combination of each <em>must be unique</em>:</p>
<pre><code class=language-sql><span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> people(
  id serial <span class=hljs-keyword>primary</span> key,
  name text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>
);

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> jobs(
  id serial <span class=hljs-keyword>primary</span> key,
  name text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>
);

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> assignments(
  people_id <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>references</span> people(id),
  job_id <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>references</span> jobs(id),
  <span class=hljs-keyword>primary</span> key(people_id, job_id) <span class=hljs-comment>-- composite primary key</span>
);

<span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> people(name)
<span class=hljs-keyword>values</span>(<span class=hljs-string>&#x27;Darth Vader&#x27;</span>),(<span class=hljs-string>&#x27;Apple Dumpling&#x27;</span>),(<span class=hljs-string>&#x27;Duke Leto&#x27;</span>),(<span class=hljs-string>&#x27;Totoro&#x27;</span>);

<span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> jobs(name)
<span class=hljs-keyword>values</span>(<span class=hljs-string>&#x27;Control the Galaxy&#x27;</span>),(<span class=hljs-string>&#x27;Bake Apple Pies&#x27;</span>),
      (<span class=hljs-string>&#x27;Rule Arrakis&#x27;</span>),(<span class=hljs-string>&#x27;Play shakuhatchi in tree&#x27;</span>);

<span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> assignments(people_id, job_id)
<span class=hljs-keyword>values</span>
    (<span class=hljs-number>1</span>,<span class=hljs-number>1</span>),(<span class=hljs-number>1</span>,<span class=hljs-number>2</span>),
    (<span class=hljs-number>2</span>,<span class=hljs-number>2</span>),(<span class=hljs-number>2</span>,<span class=hljs-number>4</span>),
    (<span class=hljs-number>4</span>,<span class=hljs-number>4</span>),(<span class=hljs-number>4</span>,<span class=hljs-number>1</span>);
</code></pre>
<p>Querying this data involves joining the tables together. We can do this <em>exclusively</em>, meaning only data that fits our join condition (<code>people_id = people.id</code> for instance) will be included:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> <span class=hljs-operator>*</span> <span class=hljs-keyword>from</span> people <span class=hljs-comment>-- from left...</span>
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> assignments <span class=hljs-keyword>on</span> people_id <span class=hljs-operator>=</span> people.id
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> jobs <span class=hljs-keyword>on</span> jobs.id <span class=hljs-operator>=</span> assignments.job_id; <span class=hljs-comment>-- to right</span>
</code></pre>
<p>We can loosen things up a bit using a <code>left</code> or <code>left outer</code> join (same thing). Show me all data to the left of the join. In this query, we&#39;ll see all people but <code>null</code> for jobs without people:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> <span class=hljs-operator>*</span> <span class=hljs-keyword>from</span> people <span class=hljs-comment>--all data coming from here</span>
<span class=hljs-keyword>left</span> <span class=hljs-keyword>outer</span> assignments <span class=hljs-keyword>on</span> people_id <span class=hljs-operator>=</span> people.id <span class=hljs-comment>-- and here...</span>
<span class=hljs-keyword>left</span> <span class=hljs-keyword>outer</span> jobs <span class=hljs-keyword>on</span> jobs.id <span class=hljs-operator>=</span> assignments.job_id; <span class=hljs-comment>-- only matching from here</span>
</code></pre>
<p>This can work in the other direction, to the <em>right</em> of the join as well. Here we&#39;ll see all the jobs but <code>null</code> for people without jobs:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> <span class=hljs-operator>*</span> <span class=hljs-keyword>from</span> people <span class=hljs-comment>-- only matching from here</span>
<span class=hljs-keyword>right</span> <span class=hljs-keyword>outer</span> assignments <span class=hljs-keyword>on</span> people_id <span class=hljs-operator>=</span> people.id <span class=hljs-comment>-- and here...</span>
<span class=hljs-keyword>right</span> <span class=hljs-keyword>outer</span> jobs <span class=hljs-keyword>on</span> jobs.id <span class=hljs-operator>=</span> assignments.job_id; <span class=hljs-comment>--all data coming from here</span>
</code></pre>
<p>If we want to see absolutely everything, we use a <code>full outer</code> join:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> <span class=hljs-operator>*</span> <span class=hljs-keyword>from</span> people <span class=hljs-comment>--all data coming from here</span>
<span class=hljs-keyword>full</span> <span class=hljs-keyword>outer</span> assignments <span class=hljs-keyword>on</span> people_id <span class=hljs-operator>=</span> people.id <span class=hljs-comment>-- and here...</span>
<span class=hljs-keyword>full</span> <span class=hljs-keyword>outer</span> jobs <span class=hljs-keyword>on</span> jobs.id <span class=hljs-operator>=</span> assignments.job_id; <span class=hljs-comment>--all data coming from here</span>
</code></pre>
<p>This shows us everything, including jobs without people and people without jobs.</p>
<p>We can also do a <em>many to many</em> join with two tables, one of them referencing itself. This looks weird, but it implies a completely different type of relationship (bidirectional):</p>
<pre><code class=language-sql><span class=hljs-comment>-- drop our existing tables</span>
<span class=hljs-keyword>drop</span> <span class=hljs-keyword>table</span> if <span class=hljs-keyword>exists</span> people cascade;
<span class=hljs-keyword>drop</span> <span class=hljs-keyword>table</span> if <span class=hljs-keyword>exists</span> jobs cascade;
<span class=hljs-keyword>drop</span> <span class=hljs-keyword>table</span> if <span class=hljs-keyword>exists</span> assignments cascade;

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> people(
  id serial <span class=hljs-keyword>primary</span> key,
  name text <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>
);

<span class=hljs-keyword>create</span> <span class=hljs-keyword>table</span> friends(
  people_id <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span>,
  friend_id <span class=hljs-type>int</span> <span class=hljs-keyword>not</span> <span class=hljs-keyword>null</span> <span class=hljs-keyword>references</span> people(id),
  <span class=hljs-keyword>primary</span> key (people_id, friend_id) <span class=hljs-comment>-- a composite primary key</span>
);

<span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> people(name)
<span class=hljs-keyword>values</span>
    (<span class=hljs-string>&#x27;Darth Vader&#x27;</span>),
    (<span class=hljs-string>&#x27;Apple Dumpling&#x27;</span>),
    (<span class=hljs-string>&#x27;Duke Leto&#x27;</span>),
    (<span class=hljs-string>&#x27;Totoro&#x27;</span>);
<span class=hljs-keyword>insert</span> <span class=hljs-keyword>into</span> friends(people_id, friend_id)
<span class=hljs-keyword>values</span>
    (<span class=hljs-number>1</span>,<span class=hljs-number>3</span>),(<span class=hljs-number>1</span>,<span class=hljs-number>4</span>), <span class=hljs-comment>-- Vader/Leto, Vader/Totoro</span>
    (<span class=hljs-number>2</span>,<span class=hljs-number>4</span>),(<span class=hljs-number>3</span>,<span class=hljs-number>4</span>); <span class=hljs-comment>-- Apple Dumpling/Totoro, Duke Leto/Totoro</span>
</code></pre>
<p>Querying this gets interesting - what is it we hope to understand? The obvious answer is &quot;who&#39;s friends with whom&quot;, but what will the result set look like? Also, do we care about people <em>without</em> friends? </p>
<p>If we&#39;re only interested in showing friends, we can query it like this:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> people.name, friendos.name <span class=hljs-keyword>from</span> people
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> friends <span class=hljs-keyword>on</span> people.id <span class=hljs-operator>=</span> friends.people_id
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> people <span class=hljs-keyword>as</span> friendos <span class=hljs-keyword>on</span> friends.friend_id <span class=hljs-operator>=</span> friendos.id; <span class=hljs-comment>-- alias the people table to avoid naming collisions</span>
</code></pre>
<p>This exclusive result set is what we&#39;re looking for as showing a more detailed result set (using <code>left</code>, <code>right</code> or <code>full</code>) would cause duplication. In other words, we&#39;d see <code>Vader/Leto</code> and <code>Leto/Vader</code>. Friendship is kind of a mutual thing and all we need to see is a single result to define the idea.</p>
<h2 id=the-bias-discussion>The Bias Discussion</h2>
<p>In that last paragraph I just defined what friendship means and created a table design and query based on my thoughts and beliefs about friendship. Do you trust me to accurately do this? Do you trust yourself? What kinds of questions might arise from this data set in the future?</p>
<p>The answer is <em>awareness</em>. It&#39;s yet another reason we write down everything in our README file so people understand what decisions we&#39;ve made and why. If you have a team to discuss things with, do!</p>
', 'Analysis', 24, 447, '652771533', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652771533/b335959aa0', '2023-03-19 09:49:30.339056-07', '2023-03-19 09:49:30.339056-07', 'The word _bias_ might sound a bit strong when describing the use of joins. It''s important to note, however, that bias can take two forms: _implicit_ and _explicit_. I dislike brussel sprouts and will never eat them (unless they''re wrapped in bacon and then they''re tolerable). This is an _explicit_ bias and I know it!

Implicit bias can take many forms that we''re simply not aware of, including a lack of knowledge or experience. It also takes the form of unseen preferences which, in the programming world can come down to the languages you use, the editors you write in and even the music you listen to while writing that code in that editor!

We''re going to see how implicit bias can change the story our data tells. It will seem subtle - but that''s exactly the point...

## Left, Right, Full Outer Joins

In this example we work with a _many to many_ join. One person can have many jobs, and one job can have many people. Notice the composite primary key on `assignments`. This is a common primary key for joining tables. The primary key is defined by two columns instead of one, the combination of each _must be unique_:

```sql 
create table people(
  id serial primary key,
  name text not null
);

create table jobs(
  id serial primary key,
  name text not null
);

create table assignments(
  people_id int not null references people(id),
  job_id int not null references jobs(id),
  primary key(people_id, job_id) -- composite primary key
);

insert into people(name)
values(''Darth Vader''),(''Apple Dumpling''),(''Duke Leto''),(''Totoro'');

insert into jobs(name)
values(''Control the Galaxy''),(''Bake Apple Pies''),
      (''Rule Arrakis''),(''Play shakuhatchi in tree'');

insert into assignments(people_id, job_id)
values
	(1,1),(1,2),
	(2,2),(2,4),
	(4,4),(4,1);
```

Querying this data involves joining the tables together. We can do this _exclusively_, meaning only data that fits our join condition (`people_id = people.id` for instance) will be included:

```sql 
select * from people -- from left...
inner join assignments on people_id = people.id
inner join jobs on jobs.id = assignments.job_id; -- to right
```

We can loosen things up a bit using a `left` or `left outer` join (same thing). Show me all data to the left of the join. In this query, we''ll see all people but `null` for jobs without people:

```sql 
select * from people --all data coming from here
left outer assignments on people_id = people.id -- and here...
left outer jobs on jobs.id = assignments.job_id; -- only matching from here
```

This can work in the other direction, to the _right_ of the join as well. Here we''ll see all the jobs but `null` for people without jobs:

```sql 
select * from people -- only matching from here
right outer assignments on people_id = people.id -- and here...
right outer jobs on jobs.id = assignments.job_id; --all data coming from here
```

If we want to see absolutely everything, we use a `full outer` join:

```sql 
select * from people --all data coming from here
full outer assignments on people_id = people.id -- and here...
full outer jobs on jobs.id = assignments.job_id; --all data coming from here
```

This shows us everything, including jobs without people and people without jobs.

We can also do a _many to many_ join with two tables, one of them referencing itself. This looks weird, but it implies a completely different type of relationship (bidirectional):

```sql 
-- drop our existing tables
drop table if exists people cascade;
drop table if exists jobs cascade;
drop table if exists assignments cascade;

create table people(
  id serial primary key,
  name text not null
);

create table friends(
  people_id int not null,
  friend_id int not null references people(id),
  primary key (people_id, friend_id) -- a composite primary key
);

insert into people(name)
values
	(''Darth Vader''),
	(''Apple Dumpling''),
	(''Duke Leto''),
	(''Totoro'');
insert into friends(people_id, friend_id)
values
	(1,3),(1,4), -- Vader/Leto, Vader/Totoro
	(2,4),(3,4); -- Apple Dumpling/Totoro, Duke Leto/Totoro
``` 

Querying this gets interesting - what is it we hope to understand? The obvious answer is who''s friends with whom, but what will the result set look like? Also, do we care about people _without_ friends? 

If we''re only interested in showing friends, we can query it like this:

```sql
select people.name, friendos.name from people
inner join friends on people.id = friends.people_id
inner join people as friendos on friends.friend_id = friendos.id; -- alias the people table to avoid naming collisions
``` 

This exclusive result set is what we''re looking for as showing a more detailed result set (using `left`, `right` or `full`) would cause duplication. In other words, we''d see `Vader/Leto` and `Leto/Vader`. Friendship is kind of a mutual thing and all we need to see is a single result to define the idea.

## The Bias Discussion 

In that last paragraph I just defined what friendship means and created a table design and query based on my thoughts and beliefs about friendship. Do you trust me to accurately do this? Do you trust yourself? What kinds of questions might arise from this data set in the future?

The answer is _awareness_. It''s yet another reason we write down everything in our README file so people understand what decisions we''ve made and why. If you have a team to discuss things with, do!', NULL),
(69, 18, 'Spreadsheet Export', 'spreadsheet-export', 't', 'Excel is EVERYWHERE and for good reason - it''s simple to use, you can visualize data and you can even write simple functions and macros. Excel is the powerhouse of the analytical world and we need to prepare our data to work with it.', '<p>We&#39;ve been asked to assemble two queries for export: the chemical data gathered per flyby and the chemical data found over the entirety of the Cassini mission. We can do that using these queries:</p>
<pre><code class=language-sql><span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;
<span class=hljs-keyword>select</span> flybys.name <span class=hljs-keyword>as</span> flyby,
    inms.date,
    inms.source,
    chemistry.name <span class=hljs-keyword>as</span> compound,
    chemistry.formula,
    <span class=hljs-built_in>sum</span>(inms.high_sensitivity_count) <span class=hljs-keyword>as</span> sum_high,
    <span class=hljs-built_in>sum</span>(inms.low_sensitivity_count) <span class=hljs-keyword>as</span> sum_low
<span class=hljs-keyword>from</span> flybys
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> inms <span class=hljs-keyword>on</span> flyby_id <span class=hljs-operator>=</span> flybys.id
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> chemistry <span class=hljs-keyword>on</span> chemistry.molecular_weight <span class=hljs-operator>=</span> inms.mass
<span class=hljs-keyword>group</span> <span class=hljs-keyword>by</span> flybys.name, inms.date, inms.source, chemistry.name, chemistry.formula;
</code></pre>
<p>To speed things up (and uncramp our fingers) we&#39;ll create a <em>materialized view</em>. Notice how I&#39;m dropping the view if it exists and then recreating it directly. This keeps our script <em>idempotent</em>, which is required:</p>
<pre><code class=language-sql><span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;
<span class=hljs-keyword>drop</span> materialized <span class=hljs-keyword>view</span> if <span class=hljs-keyword>exists</span> results_per_flyby;
<span class=hljs-keyword>create</span> materialized <span class=hljs-keyword>view</span> results_per_flyby <span class=hljs-keyword>as</span>
<span class=hljs-keyword>select</span> flybys.name,
  flybys.date,
  inms.source,
  chemistry.name <span class=hljs-keyword>as</span> compound,
  chemistry.formula,
  <span class=hljs-built_in>sum</span>(inms.high_sensitivity_count) <span class=hljs-keyword>as</span> sum_high,
  <span class=hljs-built_in>sum</span>(inms.low_sensitivity_count) <span class=hljs-keyword>as</span> sum_low
<span class=hljs-keyword>from</span> flybys
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> inms <span class=hljs-keyword>on</span> flyby_id <span class=hljs-operator>=</span> flybys.id
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> chemistry <span class=hljs-keyword>on</span> chemistry.molecular_weight <span class=hljs-operator>=</span> inms.mass
<span class=hljs-keyword>group</span> <span class=hljs-keyword>by</span> flybys.name, flybys.date, inms.source, chemistry.name, chemistry.formula
<span class=hljs-keyword>order</span> <span class=hljs-keyword>by</span> flybys.date;
</code></pre>
<p>The overall query is a bit simpler as all we need to do is remove the <code>flybys</code> table from the <code>select</code>, <code>join</code> and <code>group by</code> list:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span>
  inms.source,
  chemistry.name <span class=hljs-keyword>as</span> compound,
  chemistry.formula,
  <span class=hljs-built_in>sum</span>(inms.high_sensitivity_count) <span class=hljs-keyword>as</span> sum_high,
  <span class=hljs-built_in>sum</span>(inms.low_sensitivity_count) <span class=hljs-keyword>as</span> sum_low
<span class=hljs-keyword>from</span> flybys
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> inms <span class=hljs-keyword>on</span> flyby_id <span class=hljs-operator>=</span> flybys.id
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> chemistry <span class=hljs-keyword>on</span> chemistry.molecular_weight <span class=hljs-operator>=</span> inms.mass
<span class=hljs-keyword>group</span> <span class=hljs-keyword>by</span> inms.source, chemistry.name, chemistry.formula)
</code></pre>
', 'Analysis', 25, 317, '652771708', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652771708/ab98e53f13', '2023-03-19 09:49:30.34197-07', '2023-03-19 09:49:30.34197-07', 'We''ve been asked to assemble two queries for export: the chemical data gathered per flyby and the chemical data found over the entirety of the Cassini mission. We can do that using these queries:

```sql
set search_path=''enceladus'';
select flybys.name as flyby,
	inms.date,
	inms.source,
	chemistry.name as compound,
	chemistry.formula,
	sum(inms.high_sensitivity_count) as sum_high,
	sum(inms.low_sensitivity_count) as sum_low
from flybys
inner join inms on flyby_id = flybys.id
inner join chemistry on chemistry.molecular_weight = inms.mass
group by flybys.name, inms.date, inms.source, chemistry.name, chemistry.formula;
``` 

To speed things up (and uncramp our fingers) we''ll create a _materialized view_. Notice how I''m dropping the view if it exists and then recreating it directly. This keeps our script _idempotent_, which is required:

```sql 
set search_path=''enceladus'';
drop materialized view if exists results_per_flyby;
create materialized view results_per_flyby as
select flybys.name,
  flybys.date,
  inms.source,
  chemistry.name as compound,
  chemistry.formula,
  sum(inms.high_sensitivity_count) as sum_high,
  sum(inms.low_sensitivity_count) as sum_low
from flybys
inner join inms on flyby_id = flybys.id
inner join chemistry on chemistry.molecular_weight = inms.mass
group by flybys.name, flybys.date, inms.source, chemistry.name, chemistry.formula
order by flybys.date;
``` 

The overall query is a bit simpler as all we need to do is remove the `flybys` table from the `select`, `join` and `group by` list:

```sql
select
  inms.source,
  chemistry.name as compound,
  chemistry.formula,
  sum(inms.high_sensitivity_count) as sum_high,
  sum(inms.low_sensitivity_count) as sum_low
from flybys
inner join inms on flyby_id = flybys.id
inner join chemistry on chemistry.molecular_weight = inms.mass
group by inms.source, chemistry.name, chemistry.formula)
```', NULL),
(70, 18, 'Ethical Considerations', 'ethics', 'f', 'It''s important to take a step back from time to time and consider just what it is you''re doing and why. In our case, we''re working with one of the most important scientific data sets of the last century - at least with respect to planetary studies.', '<p>The data from the Cassini mission upended <em>everything</em> when it came to the science of our solar system. Curt Neibur, a NASA scientist working with the data, <a href=https://www.seattletimes.com/seattle-news/science/nasas-saturn-orbiting-cassini-spacecraft-faces-fiery-finish/>had this to say</a>:</p>
<blockquote>
<p>Enceladus has no business existing, and yet there it is, practically screaming at us, &#39;Look at me, I completely invalidate all of your assumptions about the solar system&#39;!</p>
</blockquote>
<p>It&#39;s easy to get overwhelmed by the enormity of the task when analyzing a set of data like this, and to quote Dr. Ian Malcolm (Jeff Goldblum) from <em>Jurassic Park</em>:</p>
<blockquote>
<p>Your scientists were so preoccupied with whether they could, they didn&#39;t stop to think if they should.</p>
</blockquote>
<p>This is especially true when it comes to working with behavioral data that may contain private information about people. The boundaries are constantly being tested and many times programmers are isolated <em>just enough</em> from the overall project that they&#39;re unaware of the potentially harmful outcome of their work.</p>
<p>In this section we&#39;ll discuss the idea of &quot;asking whether we should&quot;, and also what type of ammunition we&#39;ll be giving our analysts.</p>
', 'Analysis', 26, 283, '652771849', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652771849/b54d630cde', '2023-03-19 09:49:30.343489-07', '2023-03-19 09:49:30.343489-07', 'The data from the Cassini mission upended _everything_ when it came to the science of our solar system. Curt Neibur, a NASA scientist working with the data, [had this to say](https://www.seattletimes.com/seattle-news/science/nasas-saturn-orbiting-cassini-spacecraft-faces-fiery-finish/):

> Enceladus has no business existing, and yet there it is, practically screaming at us, ''Look at me, I completely invalidate all of your assumptions about the solar system''!

It''s easy to get overwhelmed by the enormity of the task when analyzing a set of data like this, and to quote Dr. Ian Malcolm (Jeff Goldblum) from _Jurassic Park_:

> Your scientists were so preoccupied with whether they could, they didn''t stop to think if they should.

This is especially true when it comes to working with behavioral data that may contain private information about people. The boundaries are constantly being tested and many times programmers are isolated _just enough_ from the overall project that they''re unaware of the potentially harmful outcome of their work.

In this section we''ll discuss the idea of asking whether we should, and also what type of ammunition we''ll be giving our analysts.', NULL),
(71, 18, 'Ship It!', 'shipit', 'f', 'We feel good about the data and we''re ready to ship it off! But how? Well that, friends, is the best part! There are multiple ways to do this but by far the simplest way is with a simple shell command using PSQL and \copy.  You can drop the file anywhere you like - on your desktop so you can email it, or, what''s easiest, is to use a secure file sharing system like Dropbox, Google Drive, OneDrive - whatever. Nice and fast.', '<p>Our analysts are going to be using Excel to dig into the data so let&#39;s setup a simple way to get it to them. We can run a script for this or we can use <code>psql</code>:</p>
<pre><code class=language-sh>psql cassini -c <span class=hljs-string>&quot;\copy (select * from enceladus.results_per_flyby) to &#x27;//FILESHARE/results_per_flyby.csv&#x27; header csv;</span>
</code></pre>
<p>Running a SQL script can be easier, and also a bit more flexible. The first command will output the results of our analysis view (rollups by flyby). The second will dump the overall result:</p>
<pre><code class=language-sql><span class=hljs-keyword>set</span> search_path<span class=hljs-operator>=</span><span class=hljs-string>&#x27;enceladus&#x27;</span>;
<span class=hljs-keyword>copy</span> (<span class=hljs-keyword>select</span> <span class=hljs-operator>*</span> <span class=hljs-keyword>from</span> enceladus.results_per_flyby) 
<span class=hljs-keyword>to</span> <span class=hljs-string>&#x27;//share/results_per_flyby.csv&#x27;</span> header csv;

<span class=hljs-keyword>copy</span> (<span class=hljs-keyword>select</span>
  inms.source,
  chemistry.name <span class=hljs-keyword>as</span> compound,
  chemistry.formula,
  <span class=hljs-built_in>sum</span>(inms.high_sensitivity_count) <span class=hljs-keyword>as</span> sum_high,
  <span class=hljs-built_in>sum</span>(inms.low_sensitivity_count) <span class=hljs-keyword>as</span> sum_low
<span class=hljs-keyword>from</span> flybys
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> inms <span class=hljs-keyword>on</span> flyby_id <span class=hljs-operator>=</span> flybys.id
<span class=hljs-keyword>inner</span> <span class=hljs-keyword>join</span> chemistry <span class=hljs-keyword>on</span> chemistry.molecular_weight <span class=hljs-operator>=</span> inms.mass
<span class=hljs-keyword>group</span> <span class=hljs-keyword>by</span> inms.source, chemistry.name, chemistry.formula)
<span class=hljs-keyword>to</span> <span class=hljs-string>&#x27;//share/overall_results.csv&#x27;</span> header csv;
</code></pre>
<p>And that&#39;s it!</p>
', 'Analysis', 27, 224, '652772016', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652772016/07f6873c6e', '2023-03-19 09:49:30.351565-07', '2023-03-19 09:49:30.351565-07', 'Our analysts are going to be using Excel to dig into the data so let''s setup a simple way to get it to them. We can run a script for this or we can use `psql`:

```sh 
psql cassini -c \copy (select * from enceladus.results_per_flyby) to ''//FILESHARE/results_per_flyby.csv'' header csv;
```

Running a SQL script can be easier, and also a bit more flexible. The first command will output the results of our analysis view (rollups by flyby). The second will dump the overall result:

```sql 
set search_path=''enceladus'';
copy (select * from enceladus.results_per_flyby) 
to ''//share/results_per_flyby.csv'' header csv;

copy (select
  inms.source,
  chemistry.name as compound,
  chemistry.formula,
  sum(inms.high_sensitivity_count) as sum_high,
  sum(inms.low_sensitivity_count) as sum_low
from flybys
inner join inms on flyby_id = flybys.id
inner join chemistry on chemistry.molecular_weight = inms.mass
group by inms.source, chemistry.name, chemistry.formula)
to ''//share/overall_results.csv'' header csv;
```

And that''s it!', NULL),
(72, 18, 'Summary, and Farewell!', 'farewell', 'f', 'Parting... is such sweet sorry! I hope you were able to follow along with me in this section - because if you did your SQL and data skills just shot up - yay for you! Thanks for watching...', '<p>We did a bunch of work in this video! How fun! We learned all about the INMS and the data it collected. We also dove into joins and learned how inner, left, right and full joins can tell entirely different stories. We discussed the ethical side of things - and there&#39;s a LOT more to discuss on that front - but we covered the essentials that you&#39;ll need to remember as a developer/dba. Finally - we shipped our data in the form of CVSs!</p>
<p>We learned some very useful SQL including join syntax and what it means. We created more aggregate queries once again using group by and some new, and old functions. We created a materialized view to speed up our analysis queries and finally we exported our results using COPY to.</p>
<p>Thank you so much for watching, I really hope you enjoyed this production!</p>
<p><em>Rob</em></p>
', 'Analysis', 28, 69, '652772113', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652772113/91d34cdbea', '2023-03-19 09:49:30.35313-07', '2023-03-19 09:49:30.35313-07', 'We did a bunch of work in this video! How fun! We learned all about the INMS and the data it collected. We also dove into joins and learned how inner, left, right and full joins can tell entirely different stories. We discussed the ethical side of things - and there''s a LOT more to discuss on that front - but we covered the essentials that you''ll need to remember as a developer/dba. Finally - we shipped our data in the form of CVSs!

We learned some very useful SQL including join syntax and what it means. We created more aggregate queries once again using group by and some new, and old functions. We created a materialized view to speed up our analysis queries and finally we exported our results using COPY to.

Thank you so much for watching, I really hope you enjoyed this production!

_Rob_', NULL),
(73, 18, 'Creating Our Workspace', 'extraction-intro', 'f', 'When working with data you often hear the terms extraction, transformation and loading or ETL. This is something that data analysis people think about more than say Application Developers - which I think is a bummer. It''s important to know how the data in any application is going to be used so you can make sure you collect the right stuff!', '', 'Extraction', 3, 215, '652768146', NULL, '2d2aa978c8efaea60256f62f868eeecf', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652768146/97f9d2b107', '2023-03-19 09:49:30.354327-07', '2023-03-19 09:49:30.354327-07', 'We need to setup our dev environment (quickly) with a few bash commands:

```sh
mkdir cassini
cd cassini
mkdir csvs
touch csvs/import.sql
touch README.md
createdb cassini
```

These commands will create our working directories and, most importantly, a document where we can log what we''ve done and why we did it. That''s really important for our future selves and teammates.

To pull out the names of the columns in our CSV we use the `head` command:

```sh
head -1 csvs/master_plan.csv
```

This will display the first row of our CSV.
', NULL),
(74, 18, 'Importing the Master Plan', 'extraction-import', 'f', 'Our first task is to find the exact dates and times when Cassini flew by Enceladus and made its measurements. We need to create a time window so we can narrow down the results from the INMS - Cassini''s on board Ion Neutral Mass Spectrometer - that''s the thing that sniffed space for the chemicals we''re looking for. Off we go!', '', 'Extraction', 4, 252, '652769272', NULL, 'f8697847e0ca5055deceb989a693c8e1', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769272/f749e1d90c', '2023-03-19 09:49:30.355321-07', '2023-03-19 09:49:30.355321-07', 'When importing data into Postgres from a CSV, it''s imperative that you _do not try to alter the data_ - do that by explicitly transforming the data later on.

That means we need to import everything as `text`, because that''s the core string type in Postgres (as opposed to `varchar` etc).

To create our schema and table:

```sql
create schema csvs;
create table csvs.master_plan(
  start_time_utc text,
  duration text,
  date text,
  team text,
  spass_type text,
  target text,
  request_name text,
  library_definition text,
  title text,
  description text
);
```

Copying data from a CSV into our new table:

```sql
copy csvs.master_plan 
from ''[Absolute path to]/csvs/master_plan.csv''
delimiter '','' header csv;
```', NULL),
(75, 18, 'Inspecting the Master Plan', 'extraction-inspect', 'f', 'Now that the data is in the database, let''s poke around and see what we have, using simple select statements and getting to know the Postgres client tool psql.', '', 'Extraction', 5, 373, '652769349', NULL, '7c76d783eb1790c4a17d7973159bc6e6', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769272/f749e1d90c', '2023-03-19 09:49:30.356361-07', '2023-03-19 09:49:30.356361-07', 'Postgres ships with a powerful binary client, `psql`. If you''re not a command line person, it can take a little getting used to. It''s worth the investment, however, because the speed and scriptability of `psql` is extremely powerful.

You can login to your database with a simple command:

```sh
psql cassini
```

Once you''re in, you can have a look around and see what''s there:

```sh
\d
\d csvs.*
```

If you run a query on our `master_plan` table, you''ll quickly find the results unreadable, which means we should use expanded display using `\x` - and sometimes that doesn''t even help!

The easiest thing to do is to specify what you want to see, and to be sure you limit the results. This is our first `select` query!

```sql
select start_time_utc, duration, date from csvs.master_plan limit 5;
```

If you want to use a web-based GUI, you can run PG Web using Docker:

```yml 
pgweb:
  container_name: pgweb
  restart: always
  image: sosedoff/pgweb
  ports:
    - 8080:8081
  environment:
    - DATABASE_URL=postgres://rob@host.docker.internal/cassini?sslmode=disable
``` ', NULL),
(76, 18, 'Tangent: Working with Dates', 'tangent-dates', 'f', 'Dates and timestamps are core to working with data as you will often find that if you don''t know precisely WHEN something happened, it will become meaningless. Dates mark changes over time - those changes will often drive business decisions, so you better be correct!', '', 'Extraction', 6, 149, '652769473', NULL, '2f9ebb55011799cf00d62393c65e3407', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769473/6b71a5b80e', '2023-03-19 09:49:30.357541-07', '2023-03-19 09:49:30.357541-07', 'Bottom line: _never trust a spreadsheet_. You''re going to hear me say that a lot in this production! Especially when it comes to dates.

Postgres is pretty good at dealing with dates... in fact it''s amazingly powerful as well as correct:

```sql
select now(); -- what date and time is it where my server is located?
select now() + ''1 day'' as tomorrow; -- adding an interval is extremely easy
select now() at time zone ''America/New_York''; -- specifying a timezone
```

If you''re reading this in a browser, which I assume you are, open up the developer tools using CMD-shift-i (or Ctrl-shift-i on Windows) and open the console.

To see a typical date for JavaScript (and many other languages):

```js
new Date() //prints out a long-form date
```

To see an ISO date, which most databases like, you can use:

```js
new Date().toISOString();
```

This is a format you should let your eyes get used to.', NULL),
(77, 18, 'Validating the Master Plan', 'extraction-validation', 'f', 'The data in our mission plan looks straightforward but since it''s a plan that is based on dates, we need to jump right into validating those dates. Thankfully for us, Postgres is outstanding at date and time functionality!', '<p>The date information in our imported data looks a little strange, with a timestamp that&#39;s formatted as <code>year-dayofyear</code>, a duration, and a weird column named <code>date</code> that&#39;s formatted in a pretty simplistic way.</p>
<p>We can validate that the timestamp format won&#39;t cause problems by running a simple query, casting it to an ISO string:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> start_time_utc::<span class=hljs-type>timestamp</span> <span class=hljs-keyword>from</span> csvs.master_plan;
</code></pre>
<p>That will throw if the conversion won&#39;t work.</p>
<p>You can reconcile two fields of data by running a simple comparison. The trick, however, is to be sure they&#39;re the same type, and we can do that by casting (<code>::</code>) both to a <code>date</code>:</p>
<pre><code class=language-sql><span class=hljs-keyword>select</span> start_time_utc <span class=hljs-keyword>from</span> csvs.master_plan
<span class=hljs-keyword>where</span> start_time_utc::<span class=hljs-type>date</span> <span class=hljs-operator>&lt;&gt;</span> <span class=hljs-type>date</span>::<span class=hljs-type>date</span>;
</code></pre>
', 'Extraction', 7, 356, '652769537', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769537/aa91c46700', '2023-03-19 09:49:30.35875-07', '2023-03-19 09:49:30.35875-07', 'The date information in our imported data looks a little strange, with a timestamp that''s formatted as `year-dayofyear`, a duration, and a weird column named `date` that''s formatted in a pretty simplistic way.

We can validate that the timestamp format won''t cause problems by running a simple query, casting it to an ISO string:

```sql
select start_time_utc::timestamp from csvs.master_plan;
```

That will throw if the conversion won''t work.

You can reconcile two fields of data by running a simple comparison. The trick, however, is to be sure they''re the same type, and we can do that by casting (`::`) both to a `date`:

```sql
select start_time_utc from csvs.master_plan
where start_time_utc::date <> date::date;
```', NULL),
(78, 18, 'Creating a Proper Import Script', 'extraction-proper-script', 'f', 'We don''t like errors when running our imports and, unfortunately since we''re human, we''re going to have a lot of them. Instead of fixing things piecemeal, it''s always better to just rerun everything.', '<p>If we try to run our import script twice we&#39;re going to get an error because the schema already exists - as does our table. We <em>could</em> check to see if these things exist first, but it&#39;s much easier just to hose everything and rerun.</p>
<p>To do that, we need to drop everything first. We can also avoid errors by ensuring the <code>drop</code> only happens if the schema exists first:</p>
<pre><code class=language-sql><span class=hljs-keyword>drop</span> schema if <span class=hljs-keyword>exists</span> csvs cascade;
</code></pre>
<p>That cascade keyword will drop the target object <em>and all dependent objects</em> on it. </p>
', 'Extraction', 8, 124, '652769715', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769715/075f597fd8', '2023-03-19 09:49:30.360052-07', '2023-03-19 09:49:30.360052-07', 'If we try to run our import script twice we''re going to get an error because the schema already exists - as does our table. We _could_ check to see if these things exist first, but it''s much easier just to hose everything and rerun.

To do that, we need to drop everything first. We can also avoid errors by ensuring the `drop` only happens if the schema exists first:

```sql
drop schema if exists csvs cascade;
```

That cascade keyword will drop the target object _and all dependent objects_ on it. ', NULL),
(79, 18, 'Extraction: Summary', 'extraction-summary', 'f', 'We did a lot in this section! We dipped our toes into the lovely world of SQL and we also learned that we should NEVER trust a spreadsheet!', '<p>Hopefully you&#39;re inspired to keep playing! We did a lot in this section, believe it or not, and we&#39;re going to ramp it up and do ever more in the next ones! </p>
<p>Tally ho!</p>
', 'Extraction', 9, 73, '652769781', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/652769781/58a4fb5087', '2023-03-19 09:49:30.367669-07', '2023-03-19 09:49:30.367669-07', 'Hopefully you''re inspired to keep playing! We did a lot in this section, believe it or not, and we''re going to ramp it up and do ever more in the next ones! 

Tally ho!', NULL),
(80, 19, 'Welcome to Red:4', 'welcome', 'f', 'Welcome to Red:4 - Where the Future Starts Yesterday. Blah blah blah we hope you like it here blah blah… We don''t have a lot of time so let''s just get to it shall we?', '<p>Welcome to Red:4 - <em>Where the Future Starts Yesterday</em>. Blah blah blah we hope you like it here blah blah... We don&#39;t have a lot of time so let&#39;s just get to it shall we?</p>
<h2 id=getting-set-up>Getting Set Up</h2>
<p>If you don&#39;t have Elixir installed, <a href=http://elixir-lang.org/install.html>please do so now</a>. Installing the language is very, very simple so we went spend too much time on it.</p>
<p>Once that&#39;s done, check to be sure you have it setup right:</p>
<pre><code class=language-sh>iex
</code></pre>
<p>You should see something that looks like this:</p>
<pre><code><span class=hljs-title class_>Erlang</span>/<span class=hljs-variable constant_>OTP</span> <span class=hljs-number>18</span> [erts-<span class=hljs-number>7.1</span>] [source] [<span class=hljs-number>64</span>-bit] [<span class=hljs-attr>smp</span>:<span class=hljs-number>8</span>:<span class=hljs-number>8</span>] [<span class=hljs-keyword>async</span>-<span class=hljs-attr>threads</span>:<span class=hljs-number>10</span>] [hipe] [kernel-<span class=hljs-attr>poll</span>:<span class=hljs-literal>false</span>] [dtrace]

<span class=hljs-title class_>Interactive</span> <span class=hljs-title class_>Elixir</span> (<span class=hljs-number>1.1</span><span class=hljs-number>.1</span>) - press <span class=hljs-title class_>Ctrl</span>+C to exit (type <span class=hljs-title function_>h</span>() <span class=hljs-variable constant_>ENTER</span> <span class=hljs-keyword>for</span> help)
<span class=hljs-title function_>iex</span>(<span class=hljs-number>1</span>)&gt;
</code></pre>
<p>Don&#39;t worry if you don&#39;t know what it means. You&#39;ll see a lot that won&#39;t make sense - for now <em>let it wash over you</em>. If this doesn&#39;t work for you read up on the docs.</p>
<h2 id=questions-issues-we-have-a-discussion-board>Questions? Issues? We Have a Discussion Board</h2>
<p>I set up <a href=https://github.com/bigmachine-io/taking-off/discussions>a discussion board</a> for this course up at GitHub so please feel free to drop by and leave a note.</p>
', 'Getting Started', 1, 286, '220047319', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220047319/a441b21c60', '2023-03-19 09:49:30.402514-07', '2023-03-19 09:49:30.402514-07', 'Welcome to Red:4 - *Where the Future Starts Yesterday*. Blah blah blah we hope you like it here blah blah... We don''t have a lot of time so let''s just get to it shall we?

##  Getting Set Up

If you don''t have Elixir installed, [please do so now](http://elixir-lang.org/install.html). Installing the language is very, very simple so we went spend too much time on it.

Once that''s done, check to be sure you have it setup right:

```sh
iex
```

You should see something that looks like this:

```
Erlang/OTP 18 [erts-7.1] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.1.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

Don''t worry if you don''t know what it means. You''ll see a lot that won''t make sense - for now *let it wash over you*. If this doesn''t work for you read up on the docs.

## Questions? Issues? We Have a Discussion Board

I set up [a discussion board](https://github.com/bigmachine-io/taking-off/discussions) for this course up at GitHub so please feel free to drop by and leave a note.', NULL),
(81, 19, 'List and Enumeration Basics', 'list-and-enum', 'f', 'Functional programming is all about transforming data and if we''re going to work with Solar Flares, we need to understand how Lists work - how we query, slice, dice, add and remove. That''s what we''re going to do now.', '<h3 id=four-important-friends>Four Important Friends</h3>
<p>There are three Elixir modules that you&#39;ll use most often when working with lists of data: <code>Enum</code>, <code>List</code> and <code>Keyword</code>:</p>
<ul>
<li><code>Enum</code> does enumeration functions. Mapping data, filtering, finding, grouping... things like that. This module is <em>absolutely fundamental</em>; get to know it!</li>
<li><code>List</code> handles list-specific operations whereas <code>Enum</code> will work with anything that you iterate over (or that is <em>enumerable</em>). Inserting, deleting, first and last - the <code>List</code> module is another that you&#39;ll want to know well.</li>
<li>As you might suspect, <code>Keyword</code> does a lot of what <code>List</code> does, but for keyword lists.</li>
</ul>
<p>In addition to these, Elixir supports <em>list comprehensions</em>. This is syntactic sugar for iterating over enumerable structures, but comes with built-in filters and the unique ability to have more than one generator.  We&#39;ll get to these last - they can be quite complicated.</p>
', 'Going Deeper', 10, 1490, '220056772', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220056772/66b774bce8', '2023-03-19 09:49:30.404312-07', '2023-03-19 09:49:30.404312-07', '### Four Important Friends

There are three Elixir modules that you''ll use most often when working with lists of data: `Enum`, `List` and `Keyword`:

 - `Enum` does enumeration functions. Mapping data, filtering, finding, grouping... things like that. This module is *absolutely fundamental*; get to know it!
 - `List` handles list-specific operations whereas `Enum` will work with anything that you iterate over (or that is *enumerable*). Inserting, deleting, first and last - the `List` module is another that you''ll want to know well.
 - As you might suspect, `Keyword` does a lot of what `List` does, but for keyword lists.

In addition to these, Elixir supports *list comprehensions*. This is syntactic sugar for iterating over enumerable structures, but comes with built-in filters and the unique ability to have more than one generator.  We''ll get to these last - they can be quite complicated.
', NULL),
(82, 19, 'Recursion and Refactoring Our Solar Flares', 'refactoring-solar-flares', 'f', 'Most developers know about recursion and have used it once or twice in their careers; perhaps more. It can be quite difficult to get right - this is not the case with Elixir. With a combination of pattern matching and the head/tail functionality of Lists, recursively iterating over lists is straightforward.', '<p>I&#39;m exhausted. I called in sick today... I&#39;ve been up for 28 straight hours which isn&#39;t so bad... I guess but WOW was it cold last night. I think I came down with rickets or something.</p>
<p>Anyway the Science Team reviewed the Solar Flare stuff you did and they said it was &quot;OK&quot;. They didn&#39;t give their feedback to the CTO yet because they wanted some changes made - we get to do that today.</p>
<p>The first thing they want is to understand what the total exposure to all of the flares amounts to. This is a simple summing calculation you should be able to do easily - but the Science Team is being rather micro-manager-y about all of this and they want to evaluate some different ways that we can run the calcs.</p>
<p>Sometimes I like my job... other times...</p>
<h3 id=using-recursion>Using Recursion</h3>
<p>With a combination of pattern matching and the head/tail functionality of Lists, recursively iterating over lists is quite simple:</p>
<pre><code class=language-elixir><span class=hljs-function><span class=hljs-keyword>def</span> <span class=hljs-title>total_flare_power</span></span>(list)  <span class=hljs-keyword>do</span>
  total_flare_power(list, <span class=hljs-number>0</span>)
<span class=hljs-keyword>end</span>

<span class=hljs-function><span class=hljs-keyword>def</span> <span class=hljs-title>total_flare_power</span></span>([], total),  <span class=hljs-symbol>do:</span> total

<span class=hljs-function><span class=hljs-keyword>def</span> <span class=hljs-title>total_flare_power</span></span>([head | tail], total) <span class=hljs-keyword>do</span>
  new_total = power(head) + total
  total_flare_power(tail, new_total)
<span class=hljs-keyword>end</span>
</code></pre>
<p>Let your eyes wander on that for a second, and then I&#39;ll explain a bit.</p>
', 'Going Deeper', 11, 1490, '220057435', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220057435/ee558d0a8b', '2023-03-19 09:49:30.40523-07', '2023-03-19 09:49:30.40523-07', 'I''m exhausted. I called in sick today... I''ve been up for 28 straight hours which isn''t so bad... I guess but WOW was it cold last night. I think I came down with rickets or something.

Anyway the Science Team reviewed the Solar Flare stuff you did and they said it was OK. They didn''t give their feedback to the CTO yet because they wanted some changes made - we get to do that today.

The first thing they want is to understand what the total exposure to all of the flares amounts to. This is a simple summing calculation you should be able to do easily - but the Science Team is being rather micro-manager-y about all of this and they want to evaluate some different ways that we can run the calcs.

Sometimes I like my job... other times...

### Using Recursion

With a combination of pattern matching and the head/tail functionality of Lists, recursively iterating over lists is quite simple:

```elixir
def total_flare_power(list)  do
  total_flare_power(list, 0)
end

def total_flare_power([], total),  do: total

def total_flare_power([head | tail], total) do
  new_total = power(head) + total
  total_flare_power(tail, new_total)
end
```
Let your eyes wander on that for a second, and then I''ll explain a bit.
', NULL),
(83, 19, 'if, unless, and cond', 'if-unless-cond', 'f', 'Here''s something weird to think about: in a high-level functional language such as Elixir, writing conditional code is not exactly idiomatic. Using a combination of pattern matching and syntax rules we can write extremely clean code free of if statements and conditionals in general', '<p>One thing I dislike about most code books is they tell you about syntax rules, but not about <em>how people actually write the code in the wild</em>. I need you to write solid code here at Red:4, so let&#39;s take a second to talk about style.</p>
<h3 id=if-you-need-if>If You Need &quot;if&quot;</h3>
<p>Let&#39;s revisit our <code>Solar</code> module&#39;s <code>power</code> function. When I first wrote it, I did what most programmers would do:</p>
<pre><code class=language-elixir><span class=hljs-class><span class=hljs-keyword>defmodule</span> <span class=hljs-title>Solar</span></span> <span class=hljs-keyword>do</span>
  <span class=hljs-function><span class=hljs-keyword>def</span> <span class=hljs-title>power</span></span>(flare) <span class=hljs-keyword>do</span>
    factor = <span class=hljs-number>1</span>
    <span class=hljs-keyword>if</span>(flare.classification == <span class=hljs-symbol>:M</span>) <span class=hljs-keyword>do</span>
      factor = <span class=hljs-number>10</span>
    <span class=hljs-keyword>end</span>
    <span class=hljs-keyword>if</span>(flare.classification == <span class=hljs-symbol>:X</span>) <span class=hljs-keyword>do</span>
      factor = <span class=hljs-number>1000</span>
    <span class=hljs-keyword>end</span>
    factor * flare.scale
  <span class=hljs-keyword>end</span>
<span class=hljs-keyword>end</span>
</code></pre>
<p>This code isn&#39;t bad, necessarily, but you&#39;ll notice the lack of <code>else if</code> here. Which is OK, as that&#39;s basically the same thing as a bunch of <code>if</code> statements.</p>
<p>The interesting thing about <code>if</code> (and <code>unless</code>) in Elixir is that they&#39;re not really a part of the language - <a href=http://elixir-lang.org/getting-started/case-cond-and-if.html#if-and-unless>they&#39;re <em>macros</em></a>:</p>
<blockquote>
<p>An interesting note regarding if/2 and unless/2 is that they are implemented as macros in the language; they aren’t special language constructs as they would be in many languages. You can check the documentation and the source of if/2 in the Kernel module docs...</p>
</blockquote>
<p>An <code>if</code> (or <code>unless</code>) statement is generally only used when you have a single condition you want to evaluate and they aren&#39;t used very often. In fact, I&#39;ve written a number of Elixir libraries (some quite large) as well as a pretty large ecommerce application. I have, perhaps, two <code>if</code> statements (if that) in <em>all of the Elixir code I&#39;ve ever written</em>. </p>
<p>You just don&#39;t need them when you have pattern matching and smaller, isolated functions.</p>
', 'Going Deeper', 12, 353, '220058716', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220058716/8587612dc5', '2023-03-19 09:49:30.406234-07', '2023-03-19 09:49:30.406234-07', 'One thing I dislike about most code books is they tell you about syntax rules, but not about *how people actually write the code in the wild*. I need you to write solid code here at Red:4, so let''s take a second to talk about style.

### If You Need if

Let''s revisit our `Solar` module''s `power` function. When I first wrote it, I did what most programmers would do:

```elixir
defmodule Solar do
  def power(flare) do
    factor = 1
    if(flare.classification == :M) do
      factor = 10
    end
    if(flare.classification == :X) do
      factor = 1000
    end
    factor * flare.scale
  end
end
```

This code isn''t bad, necessarily, but you''ll notice the lack of `else if` here. Which is OK, as that''s basically the same thing as a bunch of `if` statements.

The interesting thing about `if` (and `unless`) in Elixir is that they''re not really a part of the language - [they''re *macros*](http://elixir-lang.org/getting-started/case-cond-and-if.html#if-and-unless):

>An interesting note regarding if/2 and unless/2 is that they are implemented as macros in the language; they aren’t special language constructs as they would be in many languages. You can check the documentation and the source of if/2 in the Kernel module docs...

An `if` (or `unless`) statement is generally only used when you have a single condition you want to evaluate and they aren''t used very often. In fact, I''ve written a number of Elixir libraries (some quite large) as well as a pretty large ecommerce application. I have, perhaps, two `if` statements (if that) in *all of the Elixir code I''ve ever written*. 

You just don''t need them when you have pattern matching and smaller, isolated functions.
', NULL),
(84, 19, 'A Quick Look at OTP', 'otp', 'f', 'You''ve seen a lot of Elixir so far and have learned some new concepts, especially if you''re new to functional programming.  No doubt that along the way you''ve probably been wondering, however:  *how is this all supposed to work together? how can I actually build something?*. I''ve showed you a few little hints, but it''s time to get explicit on this', '<p>Building applications with Elixir is a huge subject. Learning the syntax rules and idioms is a solid first step, but soon enough you want to actually BUILD SOMETHING! I get it. Believe me. The CTO has been telling the board that I don&#39;t actually do anything - just write tutorials.</p>
<p>She doesn&#39;t like Elixir. I convinced the team to use it as I thought it was a natural fit, then our old CTO left and now we have Sara. She wants to use .NET and the only reason she hasn&#39;t flushed our project yet is because the CEO is a friend of mine and I promised her that you and I could deliver something in two week&#39;s time.</p>
<p>That delivery happens now. Let&#39;s do it.</p>
<h3 id=formalizing-the-functional-patterns>Formalizing The Functional Patterns</h3>
<p><em>Erlanger&#39;s have had 25+ years to figure out how to make their pattern-matchy, functional code fit into reusable patterns</em> which they can then turn into robust applications. They&#39;ve argued about it, written books, given talks and hugged each other with the thrill of community discovery. The result of all this: <strong>OTP</strong>. The Open Telecom Protocol.</p>
<p>Erlang was created by <a href=http://joearms.github.io/>Joe Armstrong</a>, Robert Virding and Mike Williams in 1986 for Ericsson (thus the name: <em>Er</em>icsson <em>Lang</em>uage) and was released as open source in 1998. It is currently maintained by a division of Ericsson and is used to power over half of the telecoms around the world.</p>
<p>Erlang is all about fault-tolerance, distribution, and scaling. Put together correctly, you can build a fairly bullet-proof application. But how?</p>
<h3 id=thinking-in-processes>Thinking In Processes</h3>
<p>When creating applications in Elixir, you create processes that interact with other processes. Some processes will be devoted to spawning child processes, others will be devoted to keeping certain processes alive.</p>
<p>It&#39;s like a giant bubble machine, with each bubble executing some logic. The machine is the Erlang VM, you&#39;re the bubble maker.</p>
<p>Let&#39;s blow some bubbles.</p>
', 'OTP', 13, 1403, '220065524', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220065524/be43559832', '2023-03-19 09:49:30.407238-07', '2023-03-19 09:49:30.407238-07', 'Building applications with Elixir is a huge subject. Learning the syntax rules and idioms is a solid first step, but soon enough you want to actually BUILD SOMETHING! I get it. Believe me. The CTO has been telling the board that I don''t actually do anything - just write tutorials.

She doesn''t like Elixir. I convinced the team to use it as I thought it was a natural fit, then our old CTO left and now we have Sara. She wants to use .NET and the only reason she hasn''t flushed our project yet is because the CEO is a friend of mine and I promised her that you and I could deliver something in two week''s time.

That delivery happens now. Let''s do it.

### Formalizing The Functional Patterns

*Erlanger''s have had 25+ years to figure out how to make their pattern-matchy, functional code fit into reusable patterns* which they can then turn into robust applications. They''ve argued about it, written books, given talks and hugged each other with the thrill of community discovery. The result of all this: **OTP**. The Open Telecom Protocol.

Erlang was created by [Joe Armstrong](http://joearms.github.io/), Robert Virding and Mike Williams in 1986 for Ericsson (thus the name: *Er*icsson *Lang*uage) and was released as open source in 1998. It is currently maintained by a division of Ericsson and is used to power over half of the telecoms around the world.

Erlang is all about fault-tolerance, distribution, and scaling. Put together correctly, you can build a fairly bullet-proof application. But how?

### Thinking In Processes

When creating applications in Elixir, you create processes that interact with other processes. Some processes will be devoted to spawning child processes, others will be devoted to keeping certain processes alive.

It''s like a giant bubble machine, with each bubble executing some logic. The machine is the Erlang VM, you''re the bubble maker.

Let''s blow some bubbles.
', NULL),
(85, 19, 'Working With Ecto and PostgreSQL', 'ecto-postgres', 'f', 'You have to store data somewhere and Elixir (and Erlang in general) give you quite a few tools to do so. In this video we''ll see how to push data into PostgreSQL using Ecto, the ORM created by the Elixir team.', '<h2 id=an-orm-in-a-functional-language-wait-a-minute>An ORM? In a functional language? Wait a minute...</h2>
<p>Yes, it&#39;s an argument you&#39;ll likely sit through a few times in the Elixir community. I certainly have. I have a strong opinion on this (which will become obvious in a second) but overall here&#39;s the thing:</p>
<ul>
<li>you need to store data</li>
<li>we&#39;re using a relational database to do so, which Ecto (the data tool created by the Elixir team) supports</li>
<li>that data is structured in some way</li>
</ul>
<h3 id=the-rub>The Rub</h3>
<p>Here comes the opinion... ORMs in the object-oriented world are plagued by issues relating to object-oriented programming. All of that centers around the idea that a relational database, as a concept, does not share the same general fundamental principles and concepts that object-oriented programming does. This is the &quot;impedance mismatch&quot; you&#39;ll hear about if you dive into the subject long enough.</p>
<p>It comes down to this: _there are things you can do with for loops, conditional branching, polymorphism, inheritance and <code>is-a</code> / <code>has-a</code> that are simply not part of the database vernacular. The whole idea of &quot;lazy vs. eager loading&quot; is part of this (how deep do you go to load up a related record, for instance).</p>
<p>My opinion is that <em>functional programming is no immune to this problem</em> of impedance mismatch. You&#39;ll hear Elixirists proclaim loudly that &quot;there are no objects in Elixir!&quot; while happily pumping data into structs with defaults set and a structure implied. <strong>Immutability does not mean something is not an object</strong>. This leads me to the final point...</p>
<p>One of the most difficult problems with using a relational database as a data store is that you have to <em>map</em> the data from the store to the structure (let&#39;s not kid ourselves it&#39;s an object). You have to resolve the database types (<code>varchar</code>, <code>text</code>, <code>bigint</code>, <code>date</code>, <code>date with a timezone</code>) to whatever the corresponding <em>type</em> is in the language. This is the next problem to solve.</p>
<p>How do you map a PostgreSQL <code>JSONB</code> field to a field on a struct? That&#39;s right: <em>you map it somehow</em>.</p>
<p>So: that&#39;s the issue we have to deal with. <strong>Ecto is an ORM that doesn&#39;t think it&#39;s an ORM</strong> and the team steadfastly refuses to believe they are subject to the same issues as an ORM. </p>
<p>I could be wrong, they could be right. I&#39;ve written 3 ORMs in my career and I&#39;ll never do it again. I have scars to prove it. I feel each of those scars flare up when I use Ecto...</p>
<p>OK - opinion aside... let&#39;s get to it...</p>
<h2 id=data-time>Data Time!</h2>
<p>You&#39;ve got the basics down, I think. You might have to do some Googling but the time to make our move has come.</p>
<p>It turns out that the CTO, Sara, has tasked some developers to build a Physics library using .NET! We have a meeting later today to discuss the future of the Science Program with the board and they want to see our work!</p>
<p><em>I need this space station operational!</em></p>
<p>Let&#39;s get to work.</p>
<h3 id=understanding-persistence-and-otp>Understanding Persistence and OTP</h3>
<p>Let&#39;s take a look at our <code>SolarFlareRecorder</code> using an <code>Agent</code> one more time:</p>
<pre><code class=language-elixir><span class=hljs-class><span class=hljs-keyword>defmodule</span> <span class=hljs-title>SolarFlareRecorder</span></span> <span class=hljs-keyword>do</span>
  <span class=hljs-keyword>use</span> <span class=hljs-title class_>GenServer</span>

  <span class=hljs-function><span class=hljs-keyword>def</span> <span class=hljs-title>start_link</span></span> <span class=hljs-keyword>do</span> <span class=hljs-comment>#example 1</span>
    <span class=hljs-title class_>Agent</span>.start_link <span class=hljs-keyword>fn</span> -&gt; [] <span class=hljs-keyword>end</span>
  <span class=hljs-keyword>end</span>

  <span class=hljs-comment>#public API</span>
  <span class=hljs-function><span class=hljs-keyword>def</span> <span class=hljs-title>record_flare</span></span>(pid, {<span class=hljs-symbol>:flare</span>, <span class=hljs-symbol>classification:</span> c, <span class=hljs-symbol>scale:</span> s} = flare) <span class=hljs-keyword>do</span>
    <span class=hljs-title class_>Agent</span>.get_and_update pid, <span class=hljs-keyword>fn</span> -&gt;
      new_state = <span class=hljs-title class_>List</span>.insert_at flares, <span class=hljs-number>-1</span>, flare
      {<span class=hljs-symbol>:ok</span>, new_state}
    <span class=hljs-keyword>end</span>
  <span class=hljs-keyword>end</span>

  <span class=hljs-function><span class=hljs-keyword>def</span> <span class=hljs-title>get_flares</span></span>(pid) <span class=hljs-keyword>do</span>
    <span class=hljs-title class_>Agent</span>.get pid, <span class=hljs-keyword>fn</span>(flares) -&gt;
      flares
    <span class=hljs-keyword>end</span>
  <span class=hljs-keyword>end</span>
<span class=hljs-keyword>end</span>
</code></pre>
<p>In the last chapter I mentioned I would be coming back to the idea of persistence with our Agent. Now that you know a little bit about OTP and how Agents work - how would you handle data persistence with our <code>SolarFlareRecorder</code>? Let&#39;s think about this for a second before we dive in.</p>
', 'OTP', 14, 751, '220067793', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220067793/38a74aa1f5', '2023-03-19 09:49:30.408756-07', '2023-03-19 09:49:30.408756-07', '## An ORM? In a functional language? Wait a minute...

Yes, it''s an argument you''ll likely sit through a few times in the Elixir community. I certainly have. I have a strong opinion on this (which will become obvious in a second) but overall here''s the thing:

 - you need to store data
 - we''re using a relational database to do so, which Ecto (the data tool created by the Elixir team) supports
 - that data is structured in some way

### The Rub

Here comes the opinion... ORMs in the object-oriented world are plagued by issues relating to object-oriented programming. All of that centers around the idea that a relational database, as a concept, does not share the same general fundamental principles and concepts that object-oriented programming does. This is the impedance mismatch you''ll hear about if you dive into the subject long enough.

It comes down to this: _there are things you can do with for loops, conditional branching, polymorphism, inheritance and `is-a` / `has-a` that are simply not part of the database vernacular. The whole idea of lazy vs. eager loading is part of this (how deep do you go to load up a related record, for instance).

My opinion is that _functional programming is no immune to this problem_ of impedance mismatch. You''ll hear Elixirists proclaim loudly that there are no objects in Elixir! while happily pumping data into structs with defaults set and a structure implied. **Immutability does not mean something is not an object**. This leads me to the final point...

One of the most difficult problems with using a relational database as a data store is that you have to _map_ the data from the store to the structure (let''s not kid ourselves it''s an object). You have to resolve the database types (`varchar`, `text`, `bigint`, `date`, `date with a timezone`) to whatever the corresponding _type_ is in the language. This is the next problem to solve.

How do you map a PostgreSQL `JSONB` field to a field on a struct? That''s right: _you map it somehow_.

So: that''s the issue we have to deal with. **Ecto is an ORM that doesn''t think it''s an ORM** and the team steadfastly refuses to believe they are subject to the same issues as an ORM. 

I could be wrong, they could be right. I''ve written 3 ORMs in my career and I''ll never do it again. I have scars to prove it. I feel each of those scars flare up when I use Ecto...

OK - opinion aside... let''s get to it...

## Data Time!

You''ve got the basics down, I think. You might have to do some Googling but the time to make our move has come.

It turns out that the CTO, Sara, has tasked some developers to build a Physics library using .NET! We have a meeting later today to discuss the future of the Science Program with the board and they want to see our work!

*I need this space station operational!*

Let''s get to work.

### Understanding Persistence and OTP

Let''s take a look at our `SolarFlareRecorder` using an `Agent` one more time:

```elixir
defmodule SolarFlareRecorder do
  use GenServer

  def start_link do #example 1
    Agent.start_link fn -> [] end
  end

  #public API
  def record_flare(pid, {:flare, classification: c, scale: s} = flare) do
    Agent.get_and_update pid, fn ->
      new_state = List.insert_at flares, -1, flare
      {:ok, new_state}
    end
  end

  def get_flares(pid) do
    Agent.get pid, fn(flares) ->
      flares
    end
  end
end
```

In the last chapter I mentioned I would be coming back to the idea of persistence with our Agent. Now that you know a little bit about OTP and how Agents work - how would you handle data persistence with our `SolarFlareRecorder`? Let''s think about this for a second before we dive in.
', NULL),
(86, 19, 'Troubleshooting OTP Errors', 'troubleshooting-otp-errors', 'f', 'We''re in the weeds now! Sorry for the pain, but hey, backing over a cliff is what we do as developers isn''t it? You *will find yourself completely stuck* when working with Elixir and I need you to be able to reason your way out of this mess.', '<h3 id=unraveling-this-ball-of-suck>Unraveling This Ball of Suck</h3>
<p>What we&#39;ve just run into is an OTP process not being able to talk to another OTP process. Let this error seer into your eyes, because this <em>is not the last time you&#39;ll see it</em>:</p>
<pre><code>** (<span class=hljs-variable constant_>EXIT</span>) no process
</code></pre>
<p>I believe I have spent <em>days</em> on <code>no process</code> errors, and only now have I begun to understand how to troubleshoot them. Let&#39;s walk through this together.</p>
<p>The first thing to do is to sit back and visualize the application you&#39;ve created. We know that at the top level we have an application called <code>Physics</code> and that it requires other applications - we set this up in our <code>mix.exs</code> file:</p>
<pre><code><span class=hljs-attr>applications</span>: [:logger, :timex, :postgrex, :ecto]
</code></pre>
<p>When our application starts, it will, in turn, startup <code>Logger</code>, <code>Timex</code>, <code>Postgrex</code> and <code>Ecto</code>. This will start our <code>Repo</code> and off we go. But that&#39;s not what&#39;s happening here.</p>
<p>Looking at the exact error, we see that <code>:erlang</code> is trying to send a message to <code>Physics.Repo.Pool</code>:</p>
<pre><code> ** (<span class=hljs-variable constant_>EXIT</span>) no process
    :erlang.<span class=hljs-title function_>send</span>(<span class=hljs-title class_>Physics</span>.<span class=hljs-property>Repo</span>.<span class=hljs-property>Pool</span>, {:<span class=hljs-string>&quot;$gen_cast&quot;</span>, {:cancel_waiting, #<span class=hljs-title class_>Reference</span>&lt;<span class=hljs-number>0.0</span><span class=hljs-number>.1</span><span class=hljs-number>.1769</span>&gt;}}, [:noconnect]) # example <span class=hljs-number>1</span>
    (stdlib) gen_server.<span class=hljs-property>erl</span>:<span class=hljs-number>416</span>: :gen_server.<span class=hljs-property>do_send</span>/<span class=hljs-number>2</span>
    (stdlib) gen_server.<span class=hljs-property>erl</span>:<span class=hljs-number>232</span>: :gen_server.<span class=hljs-property>do_cast</span>/<span class=hljs-number>2</span>
    src/poolboy.<span class=hljs-property>erl</span>:<span class=hljs-number>58</span>: :poolboy.<span class=hljs-property>checkout</span>/<span class=hljs-number>3</span>
    lib/db_connection/poolboy.<span class=hljs-property>ex</span>:<span class=hljs-number>36</span>: <span class=hljs-title class_>DBConnection</span>.<span class=hljs-property>Poolboy</span>.<span class=hljs-property>checkout</span>/<span class=hljs-number>2</span>
    lib/db_connection.<span class=hljs-property>ex</span>:<span class=hljs-number>811</span>: <span class=hljs-title class_>DBConnection</span>.<span class=hljs-property>checkout</span>/<span class=hljs-number>2</span>
    lib/db_connection.<span class=hljs-property>ex</span>:<span class=hljs-number>717</span>: <span class=hljs-title class_>DBConnection</span>.<span class=hljs-property>run</span>/<span class=hljs-number>3</span>
    lib/db_connection.<span class=hljs-property>ex</span>:<span class=hljs-number>421</span>: <span class=hljs-title class_>DBConnection</span>.<span class=hljs-property>query</span>/<span class=hljs-number>4</span>
</code></pre>
<p>Reading this stack trace from bottom to top, we can reason that:</p>
<ul>
<li><code>DBConnection</code> is trying to execute a query. We&#39;ve made it this far, which is good!</li>
<li>Upon trying to <code>checkout</code> something, a library called <code>Poolboy</code> is trying use a <code>GenServer</code> without success.</li>
<li>The error <em>is not coming from Ecto or Postgrex, the driver.</em> This is critical - it&#39;s <em>coming from Erlang</em> which stops everything saying &quot;I don&#39;t have the process you want&quot;.</li>
</ul>
<p>The thing we need to figure out is this: <em>what process is Erlang trying to find?</em></p>
', 'OTP', 16, 649, '220068144', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220068144/9de4b26f93', '2023-03-19 09:49:30.411477-07', '2023-03-19 09:49:30.411477-07', '### Unraveling This Ball of Suck

What we''ve just run into is an OTP process not being able to talk to another OTP process. Let this error seer into your eyes, because this *is not the last time you''ll see it*:

```
** (EXIT) no process
```

I believe I have spent *days* on `no process` errors, and only now have I begun to understand how to troubleshoot them. Let''s walk through this together.

The first thing to do is to sit back and visualize the application you''ve created. We know that at the top level we have an application called `Physics` and that it requires other applications - we set this up in our `mix.exs` file:

```
applications: [:logger, :timex, :postgrex, :ecto]
```

When our application starts, it will, in turn, startup `Logger`, `Timex`, `Postgrex` and `Ecto`. This will start our `Repo` and off we go. But that''s not what''s happening here.

Looking at the exact error, we see that `:erlang` is trying to send a message to `Physics.Repo.Pool`:

```
 ** (EXIT) no process
    :erlang.send(Physics.Repo.Pool, {:$gen_cast, {:cancel_waiting, #Reference<0.0.1.1769>}}, [:noconnect]) # example 1
    (stdlib) gen_server.erl:416: :gen_server.do_send/2
    (stdlib) gen_server.erl:232: :gen_server.do_cast/2
    src/poolboy.erl:58: :poolboy.checkout/3
    lib/db_connection/poolboy.ex:36: DBConnection.Poolboy.checkout/2
    lib/db_connection.ex:811: DBConnection.checkout/2
    lib/db_connection.ex:717: DBConnection.run/3
    lib/db_connection.ex:421: DBConnection.query/4
```

Reading this stack trace from bottom to top, we can reason that:

 - `DBConnection` is trying to execute a query. We''ve made it this far, which is good!
 - Upon trying to `checkout` something, a library called `Poolboy` is trying use a `GenServer` without success.
 - The error *is not coming from Ecto or Postgrex, the driver.* This is critical - it''s *coming from Erlang* which stops everything saying I don''t have the process you want.

The thing we need to figure out is this: *what process is Erlang trying to find?*
', NULL),
(87, 19, 'Bombs Away!', 'bombs-away', 'f', 'Developers often confuse *asynchronous* execution with *concurrent* or parallel execution. I do this often! It''s something I learn and unlearn, all the time. Let''s take a small tangent and discuss the difference.', '<p>You know enough to be dangerous, so let&#39;s blow some stuff up shall we? Here&#39;s the deal: <em>I need to show the CEO the real power of Elixir.</em> This is a HUGE roll of the dice on my part, and we could both be fired... but it would be really fun so who cares?</p>
<p><em>I want to overwhelm our database and bring it down.</em> Basically a ddos attack on PostgreSQL using 12 or so lines of code. Elegant and powerful.</p>
<p>Think about how you would do that with Ruby, JavaScript, .NET. You would have to write something concurrent and orchestrate it in such a way as to take up all of PostgreSQL&#39;s connections at once, which is a little harder than it sounds...</p>
<h3 id=thinking-about-asynchronicity>Thinking About Asynchronicity</h3>
<p>Developers often confuse <em>asynchronous</em> execution with <em>concurrent</em> or parallel execution. I do this often! It&#39;s something I learn and unlearn, all the time. Let&#39;s take a small tangent and discuss the difference.</p>
<p>If I was to kick up a Node application and fire off 1000 queries at once, what do you think would happen? It would indeed involve <em>asynchronous</em> execution, but would it be <em>concurrent</em>? We need things to be concurrent if we ever have a hope of bringing PostgreSQL down.</p>
<p>PostgreSQL has a default connection pool size of 50; this means that 50 different clients can connect and execute queries at the same time. You can up this, if you want, but they recommend setting it to 100, max.</p>
<p>This might not seem like much, but consider that PostgreSQL (if properly tuned) will execute most queries in a few milliseconds, at most. Even if you were to try and run 1000 queries with only 50 clients available, you would have to make sure they were all demanded within <em>microseconds</em> of each other. This is a little difficult.</p>
<p>I&#39;ve tried it. With Node as a matter of fact. Let&#39;s see what happened...</p>
', 'OTP', 17, 708, '220068541', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220068541/d07c1bbaf7', '2023-03-19 09:49:30.418401-07', '2023-03-19 09:49:30.418401-07', 'You know enough to be dangerous, so let''s blow some stuff up shall we? Here''s the deal: *I need to show the CEO the real power of Elixir.* This is a HUGE roll of the dice on my part, and we could both be fired... but it would be really fun so who cares?

*I want to overwhelm our database and bring it down.* Basically a ddos attack on PostgreSQL using 12 or so lines of code. Elegant and powerful.

Think about how you would do that with Ruby, JavaScript, .NET. You would have to write something concurrent and orchestrate it in such a way as to take up all of PostgreSQL''s connections at once, which is a little harder than it sounds...

### Thinking About Asynchronicity

Developers often confuse *asynchronous* execution with *concurrent* or parallel execution. I do this often! It''s something I learn and unlearn, all the time. Let''s take a small tangent and discuss the difference.

If I was to kick up a Node application and fire off 1000 queries at once, what do you think would happen? It would indeed involve *asynchronous* execution, but would it be *concurrent*? We need things to be concurrent if we ever have a hope of bringing PostgreSQL down.

PostgreSQL has a default connection pool size of 50; this means that 50 different clients can connect and execute queries at the same time. You can up this, if you want, but they recommend setting it to 100, max.

This might not seem like much, but consider that PostgreSQL (if properly tuned) will execute most queries in a few milliseconds, at most. Even if you were to try and run 1000 queries with only 50 clients available, you would have to make sure they were all demanded within *microseconds* of each other. This is a little difficult.

I''ve tried it. With Node as a matter of fact. Let''s see what happened...
', NULL),
(88, 19, 'Letting Elixir Soak In', 'diving-in', 't', 'Elixir syntax can be familiar and weird at the same time, especially if you''re coming from Ruby. To prepare for this section, let''s clear our minds - let go of familiar syntax cues and ''the way it''s done'' in the languages you already know.', '', 'Getting Started', 2, 524, '220047814', NULL, '', 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220047814/ced8f22f11', '2023-03-19 09:49:30.419638-07', '2023-03-19 09:49:30.419638-07', 'Let''s jump right in, shall we? Elixir syntax can be familiar and weird at the same time, especially if you''re coming from Ruby. To prepare for this section, let''s clear our minds - let go of familiar syntax cues and the way it''s done in the languages you already know.

Elixir does things differently.

For instance: while Elixir has an `if` keyword (and also `unless`) - use of these is frowned upon by Elixirists and is considered a bit of a code smell. You can, indeed, write loops but hard core Elixirists favor recursion.

We''ll get into all of this, and you''ll understand why very soon. But let''s dip our toe into the purple Elixir sea and decide if we want to swim...

###  The Simplest Things

Let''s have a look at some code. You won''t understand all of it, but it''s important to get your eye used to seeing Elixir so, at this point, let it wash over you:

```ruby
# this is a comment
title = a string
price = 12.00
quantity = 1
:yellow
```

No semicolons. No braces. Elixir is a *clean* language which, like Ruby, drives expressiveness and clarity.
', NULL),
(89, 19, 'Functional Programming Primer', 'functional-primer', 'f', 'Functional programming has been around forever; it''s nothing new. Elixir is a functional language, as is its progenitor, Erlang. If you''re coming from an Object-oriented language like Java, Ruby, C#, Python or JavaScript, functional programming will take some getting used to.', '<p>Functional programming has been around forever; it&#39;s nothing new. Elixir is a functional language, as is its progenitor, Erlang. If you&#39;re coming from an Object-oriented language like Java, Ruby, C#, Python or JavaScript, functional programming will take some getting used to. That&#39;s what this chapter is all about. If you&#39;re already comfortable with the concepts you can skip right ahead.</p>
<h3 id=why-are-functional-languages-becoming-so-popular>Why Are Functional Languages Becoming So Popular?</h3>
<p>The simple answer is that computers aren&#39;t getting <em>bigger</em>, they&#39;re getting <em>wider</em>. More CPUs that can process things at the same time. Most popular languages today don&#39;t embrace parallel processing directly. JavaScript (specifically Node) allows for asynchronous programming but does so with a single thread and an external process called the Event Loop (browsers also execute JavaScript in a single thread) - this is not the same as <em>concurrent</em>, or parallel processing.</p>
<p>Processing things concurrently is at the core of answering &quot;why functional programming&quot;. Let&#39;s use those multi-core machines!</p>
<p>Functional languages are a natural for distributed programming because they don&#39;t allow <em>mutation</em> (change) and tend to be quite self-contained. Moreover the Erlang VM operates in a distributed way, encouraging programmers to develop processes, agents and tasks as opposed to objects, classes and libraries.</p>
<p>Sound familiar? Perhaps distributed, message-based architectures or (to use a buzzword) <em>microservices</em>? Yes, this is the same pattern. And Jessica Kerr (<a href=http://twitter.com/jessitron>@jessitron</a>) sums it up pretty well:</p>
<blockquote>
<p>Erlang has been providing [the connection between services] for literally 25 years. As we get more and more sophisticated microservice implementations, each one grows their own crappy version of Erlang</p>
</blockquote>
<p>It&#39;s true. Erlang has been around for many, many years and has created the standard for bullet-proof, fast, distributed programming. Other languages and platforms are trying to emulate what it does already with interesting new architectural approaches.</p>
', 'Getting Started', 3, 690, '220048693', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220048693/25cf6d1aa0', '2023-03-19 09:49:30.420526-07', '2023-03-19 09:49:30.420526-07', 'Functional programming has been around forever; it''s nothing new. Elixir is a functional language, as is its progenitor, Erlang. If you''re coming from an Object-oriented language like Java, Ruby, C#, Python or JavaScript, functional programming will take some getting used to. That''s what this chapter is all about. If you''re already comfortable with the concepts you can skip right ahead.

### Why Are Functional Languages Becoming So Popular?

The simple answer is that computers aren''t getting *bigger*, they''re getting *wider*. More CPUs that can process things at the same time. Most popular languages today don''t embrace parallel processing directly. JavaScript (specifically Node) allows for asynchronous programming but does so with a single thread and an external process called the Event Loop (browsers also execute JavaScript in a single thread) - this is not the same as *concurrent*, or parallel processing.

Processing things concurrently is at the core of answering why functional programming. Let''s use those multi-core machines!

Functional languages are a natural for distributed programming because they don''t allow *mutation* (change) and tend to be quite self-contained. Moreover the Erlang VM operates in a distributed way, encouraging programmers to develop processes, agents and tasks as opposed to objects, classes and libraries.

Sound familiar? Perhaps distributed, message-based architectures or (to use a buzzword) *microservices*? Yes, this is the same pattern. And Jessica Kerr ([@jessitron](http://twitter.com/jessitron)) sums it up pretty well:

> Erlang has been providing [the connection between services] for literally 25 years. As we get more and more sophisticated microservice implementations, each one grows their own crappy version of Erlang

It''s true. Erlang has been around for many, many years and has created the standard for bullet-proof, fast, distributed programming. Other languages and platforms are trying to emulate what it does already with interesting new architectural approaches.
', NULL),
(90, 19, 'I need you to setup a project', 'project-setup', 'f', 'You can think of Mix as your Elixir Utility Belt. It builds your projects, runs tasks for you, runs your tests, installs packages - a fascinating tool. That comes later - right now open up your terminal and navigate to a directory where you can save your work.', '<p>You can think of Mix as your Elixir Utility Belt. It builds your projects, runs tasks for you, runs your tests, installs packages - a fascinating tool. That comes later - right now open up your terminal and navigate to a directory where you can save your work.</p>
<p>This is one of many projects you&#39;ll be creating so make a <code>redfour</code> directory on your drive somewhere.</p>
<pre><code class=language-elixir>mix new physics
</code></pre>
<p>You should see some stuff splash on your screen:</p>
<pre><code class=language-sh>* creating README.md
* creating .gitignore
* creating mix.exs
* creating config
* creating config/config.exs
* creating lib
* creating lib/physics.ex
* creating <span class=hljs-built_in>test</span>
* creating <span class=hljs-built_in>test</span>/test_helper.exs
* creating <span class=hljs-built_in>test</span>/physics_test.exs

Your Mix project was created successfully.
You can use <span class=hljs-string>&quot;mix&quot;</span> to compile it, <span class=hljs-built_in>test</span> it, and more:

    <span class=hljs-built_in>cd</span> physics
    mix <span class=hljs-built_in>test</span>

Run <span class=hljs-string>&quot;mix help&quot;</span> <span class=hljs-keyword>for</span> more commands.
</code></pre>
<p>As you can see Mix created the skeleton of an application for you. There are different ways to think about this structure - as a package that&#39;s part of a library or as an app in its own right. Right now don&#39;t worry about it we&#39;ll get to that later.</p>
', 'First Steps', 4, 209, '220049142', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220049142/71ef2171ec', '2023-03-19 09:49:30.422363-07', '2023-03-19 09:49:30.422363-07', 'You can think of Mix as your Elixir Utility Belt. It builds your projects, runs tasks for you, runs your tests, installs packages - a fascinating tool. That comes later - right now open up your terminal and navigate to a directory where you can save your work.

This is one of many projects you''ll be creating so make a `redfour` directory on your drive somewhere.

```elixir
mix new physics
```

You should see some stuff splash on your screen:

```
* creating README.md
* creating .gitignore
* creating mix.exs
* creating config
* creating config/config.exs
* creating lib
* creating lib/physics.ex
* creating test
* creating test/test_helper.exs
* creating test/physics_test.exs

Your Mix project was created successfully.
You can use mix to compile it, test it, and more:

    cd physics
    mix test

Run mix help for more commands.
```

As you can see Mix created the skeleton of an application for you. There are different ways to think about this structure - as a package that''s part of a library or as an app in its own right. Right now don''t worry about it we''ll get to that later.

', NULL),
(91, 19, 'Calculating Escape Velocity', 'escape-velocity', 'f', 'I hope you''re prepared to learn on the job. I''m about to ramp things up on you and it''s for the simple reason that I''m under the gun - and to be honest *so are you*. We just got a new CTO, she arrived a few weeks after I got the job. She doesn''t like me... which I guess isn''t all that surprising.', '<p>Look I&#39;ll be honest: you and I are in a battle for our jobs. When you were brought on board I thought we had this Elixir project all sewn up but then we get a new CTO who happens to love .NET and would like nothing more than for us to fail.</p>
<p>I hate to put you in this position, but I think you have what it takes. <em>Prove me right</em>. Now let&#39;s write some code.</p>
<h3 id=organizing-the-project>Organizing the Project</h3>
<p>Open up the Physics project in your favorite editor. We need to create a module that will contain the functions we&#39;ll need to calculate Escape Velocity (E<sub>V</sub>). Let&#39;s call ours <code>rocketry</code>:</p>
<pre><code class=language-sh><span class=hljs-built_in>touch</span> lib/physics/rocketry.ex
</code></pre>
<p>Every app in Elixir is made up of smaller apps and modules. Organizing these modules can be tricky, but an agreed-upon rule is that you have an &quot;entry module&quot; with the same name as your app. This typically goes in the <code>lib</code> directory. The modules that you write for your app go in a directory with the same name.</p>
<p>Now let&#39;s define our module:</p>
<pre><code class=language-elixir><span class=hljs-class><span class=hljs-keyword>defmodule</span> <span class=hljs-title>Physics.Rocketry</span></span> <span class=hljs-keyword>do</span>
  <span class=hljs-comment>#code here</span>
<span class=hljs-keyword>end</span>
</code></pre>
<p>Here I&#39;ve defined a <code>namespace</code> for the module that follows the structure of our directories. The .NET and Java people will find this a familiar thing. Using namespaces helps keep modules organized.</p>
', 'First Steps', 5, 1192, '220078749', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220078749/b9797079f4', '2023-03-19 09:49:30.423334-07', '2023-03-19 09:49:30.423334-07', 'Look I''ll be honest: you and I are in a battle for our jobs. When you were brought on board I thought we had this Elixir project all sewn up but then we get a new CTO who happens to love .NET and would like nothing more than for us to fail.

I hate to put you in this position, but I think you have what it takes. *Prove me right*. Now let''s write some code.

### Organizing the Project

Open up the Physics project in your favorite editor. We need to create a module that will contain the functions we''ll need to calculate Escape Velocity (E<sub>V</sub>). Let''s call ours `rocketry`:

```
touch lib/physics/rocketry.ex
```

Every app in Elixir is made up of smaller apps and modules. Organizing these modules can be tricky, but an agreed-upon rule is that you have an entry module with the same name as your app. This typically goes in the `lib` directory. The modules that you write for your app go in a directory with the same name.

Now let''s define our module:

```elixir
defmodule Physics.Rocketry do
  #code here
end
```

Here I''ve defined a `namespace` for the module that follows the structure of our directories. The .NET and Java people will find this a familiar thing. Using namespaces helps keep modules organized.', NULL),
(92, 19, 'Pattern Matching Basics', 'pattern-matching', 'f', 'Pattern Matching in Elixir is one of those things that can be vexxing, interesting, or obvious. Ultimately, however, it will be confusing if you have never dealt with it before.', '<p>Let&#39;s dive right in.</p>
<h3 id=rethink-assignment>Rethink Assignment</h3>
<p>In programming, you typically <em>assign</em> a variable with an <code>=</code> sign. In math, <code>=</code> means something else entirely. It means the two terms on either side of the sign <em>are equivalent</em>. That&#39;s the way it is with Elixir.</p>
<p>When Elixir sees an <code>=</code> it will try to make both sides equivalent. When you call a function, Elixir will do the same thing with the arguments you pass: pattern matching against the function&#39;s argument list.</p>
<p>You&#39;ve already seen a little of this in the previous chapters. Let&#39;s take a look at a few more examples (feel free to open up iex and type these examples in):</p>
<pre><code class=language-elixir><span class=hljs-comment>#a simple assignment</span>
pattern = <span class=hljs-string>&quot;match&quot;</span>

<span class=hljs-string>&quot;pat&quot;</span> &lt;&gt; tern = <span class=hljs-string>&quot;pattern match&quot;</span>
<span class=hljs-comment>#a little weirder, the variable &#x27;tern&#x27; = &quot;tern match&quot;</span>

[<span class=hljs-number>1</span>, x, <span class=hljs-number>5</span>] = [<span class=hljs-number>1</span>, <span class=hljs-number>10</span>, <span class=hljs-number>5</span>]
<span class=hljs-comment>#something straightforward: x = 10</span>
</code></pre>
<p>This is, in a sense, <em>destructuring assignment</em> that you would see in JavaScript, Ruby, ES6:</p>
<pre><code class=language-js><span class=hljs-keyword>var</span> [x, y, z] = [<span class=hljs-number>1</span>,<span class=hljs-number>2</span>,<span class=hljs-number>3</span>];
</code></pre>
<p>But Pattern Matching is a whole lot more than this. While you can indeed use it to assign values, it&#39;s much more useful when used with function calls.</p>
', 'First Steps', 6, 445, '220051125', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220051125/66b774bce8', '2023-03-19 09:49:30.424591-07', '2023-03-19 09:49:30.424591-07', 'Let''s dive right in.

### Rethink Assignment

In programming, you typically *assign* a variable with an `=` sign. In math, `=` means something else entirely. It means the two terms on either side of the sign *are equivalent*. That''s the way it is with Elixir.

When Elixir sees an `=` it will try to make both sides equivalent. When you call a function, Elixir will do the same thing with the arguments you pass: pattern matching against the function''s argument list.

You''ve already seen a little of this in the previous chapters. Let''s take a look at a few more examples (feel free to open up iex and type these examples in):

```elixir
#a simple assignment
pattern = match

pat <> tern = pattern match
#a little weirder, the variable ''tern'' = tern match

[1, x, 5] = [1, 10, 5]
#something straightforward: x = 10
```


This is, in a sense, *destructuring assignment* that you would see in JavaScript, Ruby, ES6:

```js
var [x, y, z] = [1,2,3];
```


But Pattern Matching is a whole lot more than this. While you can indeed use it to assign values, it''s much more useful when used with function calls.
', NULL),
(93, 19, 'Calculating Orbital Distance', 'orbital-distance', 'f', 'In this part we tidy things up, plugging in Authentication and hooking our download service into Firebase Storage.Nice work so far! The Science Team loves what we''re doing and, as you might expect, have given us more work.', '<p>Nice work so far! The Science Team loves what we&#39;re doing and, as you might expect, have given us more work.</p>
<p>So, I have a few changes I need you to make to the Physics library. First, we need to know the E<sub>v</sub>  of both Mars and the Moon. See if you can add those additional methods for me? Here&#39;s the info you need:</p>
<pre><code class=language-sh>The mass of Mars is 6.39e23kg and its radius is 3.4e6m.
The mass of the Moon is 7.35e22kg and its radius is 1.738e6m.
</code></pre>
<p>Given that E<sub>vMars</sub> (5.1 km/s) and E<sub>vMoon</sub> (2.38 km/s) is already known - make sure your tests pass with these values. Yes, as you might have guessed already, the Science Team has a severe case of NIH - <em>Not Invented Here</em> syndrome. They won&#39;t rely on any bit of programming or data unless it originates from within these walls.</p>
<p>So here we are calculating the basics from scratch. Which is OK... you never know if you&#39;ll be the first to find an equation is incorrect!</p>
', 'First Steps', 7, 1282, '220051756', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220051756/66b774bce8', '2023-03-19 09:49:30.426107-07', '2023-03-19 09:49:30.426107-07', 'Nice work so far! The Science Team loves what we''re doing and, as you might expect, have given us more work.

So, I have a few changes I need you to make to the Physics library. First, we need to know the E<sub>v</sub>  of both Mars and the Moon. See if you can add those additional methods for me? Here''s the info you need:

```
The mass of Mars is 6.39e23kg and its radius is 3.4e6m.
The mass of the Moon is 7.35e22kg and its radius is 1.738e6m.
```

Given that E<sub>vMars</sub> (5.1 km/s) and E<sub>vMoon</sub> (2.38 km/s) is already known - make sure your tests pass with these values. Yes, as you might have guessed already, the Science Team has a severe case of NIH - *Not Invented Here* syndrome. They won''t rely on any bit of programming or data unless it originates from within these walls.

So here we are calculating the basics from scratch. Which is OK... you never know if you''ll be the first to find an equation is incorrect!
', NULL),
(94, 19, 'Debugging', 'debugging', 'f', 'I''m always amazed when I manage to write Elixir code that compiles correctly the first time. It almost never happens! Let''s have a look at a normal sequence you might stumble through, and I''ll see if I can save you some time.', '<h3 id=have-to-start-like-this-good-tests>Have To Start Like This: Good Tests</h3>
<p>When you focus on small, simple functions as you&#39;ve seen me do, you make life easy on yourself - especially when it comes to debugging. I&#39;ve found that the easiest thing to do is just write more tests - even if you comment them out later on.</p>
<p>Testing the little stuff will ultimately lead you to the source of the trouble, and having tests in place is almost always a good thing! All that said, let&#39;s look at a handful of situations you may run into, and see if I can&#39;t save you some frustration and bloody knuckles. I need you writing code, not figuring out the quirks of Elixir&#39;s unit testing library!</p>
<h3 id=undefined-function>Undefined Function</h3>
<p>You will bang your head on this one many times. In the download material you will notice that it does not compile:</p>
<pre><code class=language-sh>** (CompileError) <span class=hljs-built_in>test</span>/compiler_problem_test.exs:5: undefined <span class=hljs-keyword>function</span> round_to/2
</code></pre>
<p>This is a <em>compilation error</em> which tells you (of course) that the compiler couldn&#39;t find a function you invoked. Having a look at the code, do you see the issue?</p>
<pre><code class=language-elixir><span class=hljs-function><span class=hljs-keyword>defp</span> <span class=hljs-title>round_to</span></span>(val, precision) <span class=hljs-keyword>when</span> is_float(val) <span class=hljs-keyword>do</span>
  <span class=hljs-title class_>Float</span>.round(val, precision)
<span class=hljs-keyword>end</span>
</code></pre>
<p>The function is <em>private</em>. This error happens to me often because I typically set &quot;helper functions&quot; as private. In this case, I moved this function to its own module (from <code>Physics.Rocketry</code> to <code>Converter</code>) and forgot to make it public by switching from <code>defp</code> to <code>def</code>.</p>
', 'First Steps', 8, 1282, '220055227', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220055227/66b774bce8', '2023-03-19 09:49:30.432909-07', '2023-03-19 09:49:30.432909-07', '### Have To Start Like This: Good Tests

When you focus on small, simple functions as you''ve seen me do, you make life easy on yourself - especially when it comes to debugging. I''ve found that the easiest thing to do is just write more tests - even if you comment them out later on.

Testing the little stuff will ultimately lead you to the source of the trouble, and having tests in place is almost always a good thing! All that said, let''s look at a handful of situations you may run into, and see if I can''t save you some frustration and bloody knuckles. I need you writing code, not figuring out the quirks of Elixir''s unit testing library!

### Undefined Function

You will bang your head on this one many times. In the download material you will notice that it does not compile:

```
** (CompileError) test/compiler_problem_test.exs:5: undefined function round_to/2
```

This is a *compilation error* which tells you (of course) that the compiler couldn''t find a function you invoked. Having a look at the code, do you see the issue?

```elixir
defp round_to(val, precision) when is_float(val) do
  Float.round(val, precision)
end
```

The function is *private*. This error happens to me often because I typically set helper functions as private. In this case, I moved this function to its own module (from `Physics.Rocketry` to `Converter`) and forgot to make it public by switching from `defp` to `def`.

', NULL),
(95, 19, 'Solar Flare Project Setup', 'solar-flare-warning', 'f', 'We need to get rolling which means we need to setup a project and start cranking out some code! In this video we''ll structure our project with tests and get to know the difference between Elixir script files and compilable executables.', '<p>The new CTO just sent me a note. Read this:</p>
<blockquote>
<p>Please stop by at 13:20 today; I need to make sure I understand your team&#39;s progress. Please bring your little project with you and whatever code works.<br>-- Sara</p>
</blockquote>
<p><em>Little project</em>. Wow. <em>Your team&#39;s progress</em> - she&#39;s the CTO! Could she make this any more obvious? I&#39;ve had a few interactions with Sara over the years; she used leave snarky comments on my blog and ... well let&#39;s just say I was <em>rather direct</em> in my replies. I don&#39;t think it&#39;s a stretch to say that she would seriously love to fire me.</p>
<p>I&#39;m sorry I dragged you into this, but I guess that&#39;s life in a startup. For some reason I thought aerospace would be a little less cutthroat. Anyway <em>we have work to do</em> or I might be shown the door very soon. <em>No pressure...</em></p>
', 'Going Deeper', 9, 1477, '220055848', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/220055848/66b774bce8', '2023-03-19 09:49:30.435192-07', '2023-03-19 09:49:30.435192-07', 'The new CTO just sent me a note. Read this:

```
  Please stop by at 13:20 today; I need to make sure I understand your team''s progress. Please bring your little project with you and whatever code works.
  -- Sara
```


*Little project*. Wow. *Your team''s progress* - she''s the CTO! Could she make this any more obvious? I''ve had a few interactions with Sara over the years; she used leave snarky comments on my blog and ... well let''s just say I was *rather direct* in my replies. I don''t think it''s a stretch to say that she would seriously love to fire me.

I''m sorry I dragged you into this, but I guess that''s life in a startup. For some reason I thought aerospace would be a little less cutthroat. Anyway *we have work to do* or I might be shown the door very soon. *No pressure...*

', NULL);
INSERT INTO public.lessons (id, course_id, title, slug, free, summary, description, category, index, duration, vimeo_id, youtube_id, github, fa_icon, mdi_icon, download_url, created_at, updated_at, markdown, gist) VALUES
(96, 5, 'Becoming a Solo Contractor', 'solo-intro', 'f', 'Hello and welcome! Let''s kick things off by getting our heads in the right place and understanding what we''re getting ourselves into. This could be a life-changing moment for you and having a plan is essential! So let''s take a minute and wrap our heads around this.', '<h2 id=lets-get-started>Let&#39;s Get Started</h2>
<p>The tech industry has a <strong>gigantic</strong> demand for top-level developer talent. This fact makes going out on your own as a developer contractor very appealing. Before you make this jump, however, you need to set a few things up to optimize your chances at long term success.</p>
<p>It’s not a difficult process, but doing it wrong could be costly. The good news is, however, that businesses have been around for centuries. Setting one up is simply a matter of following a tried and true formula. You just have to have the discipline to plug it all in.</p>
<p>That’s what we’re going to explore in this production: a business blueprint that you can follow to setup your very own business as a developer contractor.</p>
', 'Welcome', 0, 116, '367892585', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367892585/10cbdd3539', '2023-03-19 09:49:30.456004-07', '2023-03-19 09:49:30.456004-07', NULL, NULL),
(97, 5, 'Is The Contract Programmer Thing Right For You?', 'is-the-contract-programmer-thing-right-for-you', 't', 'Going out on your own is, essentially, turning up the volume on your career. The good parts get better: freedom to choose what you do and when you do it. The bad parts get worse: you will be the worst boss you’ve ever had, and a simple mistake can greatly affect your income.', '<p>It sounds wonderful doesn&#39;t it? Being your own boss, setting your own timetable and not having to sit through pointless meetings all day. To be honest... it kind of <em>is</em> wonderful... but there are some downsides that weigh heavier on some more than others.</p>
<p>Here&#39;s the thing: <strong>you&#39;re about to become a business</strong>. Your risk is about to go up but, hopefully, so will your rewards. The key is to treat this as a business decision and to assess your risks upfront. In this video we&#39;ll lay those risks out clearly so you can weigh them as you need.</p>
', 'Career', 1, 186, '367881455', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367881455/7507229097', '2023-03-19 09:49:30.457655-07', '2023-03-19 09:49:30.457655-07', NULL, NULL),
(98, 5, 'Exercise: Get Organized!', 'excercise-get-organized', 'f', 'Everyone has their scheme and their way to get things done and if you''re that kind of person hooray! I''m actually talking about something a bit different than a personal To-Do list - we need a methodology and a way that we can ensure that we can execute our vision.', '<h2 id=get-organized-now>Get Organized Now</h2>
<p>Before you start wondering if you replied to a client email or whether the work they want you to do is worthwhile, <em>you really need to have a process for all of this</em>. If you fly by the seat of your pants you run the risk of letting someone down and losing money, so let&#39;s take a second and see some extremely simple ways to get organized.</p>
<h2 id=the-focus-your-customers>The Focus: Your Customers</h2>
<p>This is the difference between personal to-do apps as opposed to a customer-relationship tool: <em>the focus</em>. One is focused on you, the other is focused on your customer.<br>It&#39;s likely you have a way of getting tasks completed, which is great, but did you think about your customer when you were organizing your daily tasks? <em>Maybe</em>, but if you&#39;re focused on your work as opposed to theirs you&#39;re doing it wrong and it could cost you.</p>
<p>To show you what I mean, let&#39;s take a look at two very useful and FREE tools that can help you with this. You should be looking at them every day when it comes to client work, and when you have meetings, instead of popping things in your reminders or sending yourself an email, use these <em>CRM</em> tools to help you out!</p>
<h2 id=trello>Trello</h2>
<p>Here&#39;s your task: head over to my personal favorite list thingy, Trello, and have a look at their <a href=https://trello.com/templates/sales>CRM (customer relationship manager) templates</a>. Some of the automations require an upgraded account, which is pretty cheap, but most of the stuff is free.</p>
<p><img src=https://paper-attachments.dropbox.com/s_17A93C305AD7DFA50CAA3734366FE1390F7B709F7D74D0EF86C41A4DB3115007_1587320552164_trello.jpg alt=Trello></p>
<p>Trello is super easy to use and has a desktop and phone app that you can use to organize things when you&#39;re on a lunch break. If inspiration hits, pop a card in there!</p>
<p>You&#39;ll be able to track who you talked to when and about what. When a project is kicked off, create a board for it and invite your client to join the board so they can see what you&#39;re doing - it&#39;s a great all around tool.</p>
<h2 id=airtable>Airtable</h2>
<p>Some people (like me) just dig their spreadsheets and if you&#39;re that person too, than Airtable can be your new best friend. They have a set of amazing <a href=https://airtable.com/templates/sales-and-customers/expGObpa2AGjv2Z8t/lightweight-crm>CRM templates</a> that function as simple spreadsheets. I haven&#39;t used these yet (I&#39;m a Trello fan) but I use Airtable for a ton of other things, including tracking billing and expenses, and I absolutely love it.</p>
<h2 id=just-go-do-it>Just... Go. Do It.</h2>
<p>Don&#39;t overthink it... just go and set one of these things up before you forget and add it to your backlog pile. You&#39;ll see and hear me say this often: <em>don&#39;t think about it too much</em> otherwise you&#39;ll get paralyzed. Execution is the Big Thing when it comes to doing something like this and the more you can tangibly see, the more motivated you get!</p>
', 'Career', 2, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.458661-07', '2023-03-19 09:49:30.458661-07', NULL, NULL),
(99, 5, 'Creating Your Business Plan', 'creating-your-business-plan', 't', 'We’ll take a look at how a business plan can help solidify what it is we want to do when we go out on our own. We’ll use a simple template, choose a business name and detail the market that we’re about to enter. Finally, we’ll consider where we want this business to end up.', '', 'Career', 3, 372, '367881517', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367881517/2f1b723e17', '2023-03-19 09:49:30.460361-07', '2023-03-19 09:49:30.460361-07', NULL, NULL),
(100, 5, 'Exercise: Business Plan', 'excercise-create-plan', 'f', 'We can ponder about our business plan all day long - let''s not. Let''s execute by laying something down right now, and building on it. You''ve learned what''s in a business plan, now let''s put something - ANYTHING in writing and commit ourselves to this vision.', '<p>Now that you&#39;ve seen how to create a business plan - <strong>do it!</strong> I&#39;ve attached a template here for you to use, but (as always) <em>I&#39;m not a lawyer blah blah blah</em>.</p>
<p>I know I know! You’re probably making a mental note right now thinking “when I’m ready I’ll get to this”… but that’s not going to cut it. One of the things we need to get used to doing is <strong>executing</strong>. </p>
<p>That means that you, right now, need to crack open a document somewhere and start writing.</p>
<p>Here’s a tip if you don’t know what do right now… <a href=https://www.dropbox.com/paper>open up a document in Dropbox Paper</a>.  This, to me, is a perfect writing space and one that gets out of your way quickly. You can use Markdown and a bunch of other fun things (like pasting code). So… <em>just do it</em>. If you’re a Google Docs fan FINE just open the dang thing and paste this:</p>
<pre><code class=language-markdown><span class=hljs-section>## Summary</span>
[COMPANY] will launch on [DATE] and will consist of one person: me. It will provide consultancy services to clients of varying size, with the possibility of selling digital good in the next 3 to 5 years.

<span class=hljs-section>## Industry Overview</span>
Think about the niche you&#x27;re going after and why you&#x27;re going after it. Write that here, try to make it a solid sentence.

<span class=hljs-section>## Products and Services</span>
What are you going to sell? Your time? How? Products? What?

<span class=hljs-section>## Market Analysis</span>
Something made you pick this market - what was it and why? Did you see a need for valuable [AWS/Azure/GCP] Cloud Consultants? Maybe you thought people could really use your SQL skills. Just write it down here, no matter how small.

<span class=hljs-section>## Marketing Plan</span>
You have to let people know at some point what you&#x27;re doing so you can get money for it. Is your plan Twitter? Blog? Word of mouth? Write it here.

<span class=hljs-section>## Financial Plan</span>
It&#x27;s going to take a while to make money, so what are you going to do in the mean time? If you give yourself a month to get a contract and get paid, that&#x27;s an investment. Write that down here: &quot;Investing $2500 initially to get going&quot;. From that point, how much do you need to survive each month? What&#x27;s your bankroll (the amount on hand you have to have) amount to?

<span class=hljs-section>## Exit Strategy</span>
This is going to end at some point... either with the sale of the company, you purposely folding it because you wanted to work with other people, or maybe your kids take it over. SPELL IT OUT and think about what that might mean. Again: just a few paragraphs here can make a giant difference in your thinking.
</code></pre>
<h2 id=international-concerns>International Concerns</h2>
<p>I live in the USA so I have, of course, a bias. You might need to translate this a bit based on what your country allows. Either way: <em>business is business</em> and these things in this plan carry through no matter where you’re from.</p>
', 'Career', 4, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.461527-07', '2023-03-19 09:49:30.461527-07', NULL, NULL),
(101, 5, 'Exercise: Business Name', 'exercise-business-name', 'f', 'Naming things is hard and you will either spend way too long on this or way to little. Let''s give it a reasonable amount of time and then move on. I''ll help you (I hope) by sharing with you how I came up with various business names of my own... then we''ll buy a domain.', '<p>If you&#39;ve made it this far <strong>congratulations</strong>. Seriously! So many people I know decide they want to head out on their own but when their dreams are pushed into reality it becomes less fun and a bit of a toil. <em>This is OK</em>.</p>
<p>I&#39;ve dreamed of running a marathon someday but when I put in the work (running) I immediately decide it&#39;s pointless and stupid. I get it, I promise.</p>
<h2 id=focus>Focus</h2>
<p>How are you feeling right now? Anxious? Excited? Ovewhelmed? All of these are OK to feel and you&#39;ll keep feeling them as this process goes on. In fact none of it will go away until a year or so after you see that you can, indeed, make money on your own. </p>
<p>A lot of people don&#39;t believe that. The trick is to make <em>yourself</em> believe that about you. So, deep breath and let&#39;s pick a business name.</p>
<h2 id=overthinking>Overthinking</h2>
<p>You have to have a domain if you plan on creating a business. <em>Don&#39;t spend a ton of time on this</em>. <strong>Execute and make it happen</strong>, you can change your mind later on. Right now you need to feel the surge you get when you <em>execute</em>, not waiver and prevaricate over every small decision. You won&#39;t get to where you want to go if you keep noodling on it so stop that process cold by <em>doing</em>.</p>
<p>So, tell me:</p>
<ol>
<li>Where&#39;s your favorite place in the world, and what word would describe that? Think of street names, place names, businesses and <em>Write it down</em>.</li>
<li>Who&#39;s your favorite actor and what did you find inspiring about their role? <em>Write it down.</em></li>
<li>One of your best friends just threw you a surprise birthday party and a load of people showed up - some you know, some you don&#39;t. They&#39;re all looking at you with a smile on their face, thinking... what? <em>Write it down.</em></li>
</ol>
<p>All of these can be as fun/silly/serious as you want. It&#39;s up to you what you want to convey but <em>don&#39;t overthink it</em>.</p>
<h2 id=i-cant-think-of-anything>I Can&#39;t Think of Anything</h2>
<p>Yeah this has happened to me too, so let me share with you how I came up with the names of my last businesses (Red:4 Aerospace and Big Machine).</p>
<h2 id=red4>Red:4</h2>
<p>I had just created a video for Elixir that I thought would do pretty well and the projection was enough that my accountant (who&#39;s also a friend) told me I should probably create a business <em>before</em> I sell anything. He charged me some money and was about to set it up when he said &quot;give me 3 business names, ordered by preference&quot;.</p>
<p>I had no idea. It had been <em>years</em> since I had to think of any of this. At that very moment people were tweeting about Space-X and the Falcon Heavy rockets and I was like &quot;damn I wish I could work <em>there</em> because that would be FUN&quot; and it kind of hit me all of a sudden... <em>space... rockets... why not...</em>.</p>
<p>I knew I wanted the name &quot;Aerospace&quot; in the name because it sounded retro and fun. I chose &quot;Red:4&quot; because <em>The Martian</em> was the big movie at the time and I remember thinking about Red Mars and Mars being the 4th planet from the sun.</p>
<p>Thus was born my company: <em>Red:4 Aerospace</em>. I don&#39;t strictly write code for rockets and so on, but who knows?</p>
<h2 id=big-machine>Big Machine</h2>
<p>This one was a bit more ... lazy I guess? I needed a company name that sounded like &quot;I&#39;ll get this done for you&quot;, which is a thing I had issues with in the past regarding the company name. I joined my buddy doing consulting work in the late 1990s and he came into the office one day and announced that he had registered &quot;Persistent, Inc&quot; as our company and domain. He <em>was</em> the CEO so I guess that was OK but... the name was... well...</p>
<p>Let&#39;s put it this way: one of my clients asked (cheekily) one day if our name indicated that we&#39;d keep trying until we got it right. Yeah... not a good thing. <em>Everyone</em> asked how to spell it!</p>
<p>So I wanted a name for my new company that would be easy to hear and easier to say. I thought of the essence of what I was trying to do and I said &quot;I want to write code like some kind of ... big machine&quot; and there it was.</p>
<h2 id=pick-something-lets-register-it>Pick Something, Let&#39;s Register It</h2>
<p>This might take you a few minutes, so come up with 5 names and see how they feel. Shoot for easy to spell and easy to say because next we need to register that name.<br>I got lucky with Big Machine and Red:4 - both of the &quot;.io&quot; TLDs were available - but these days there are so many TLDs that it really shouldn&#39;t matter.</p>
<p>Head over to <a href=https://domains.google/>Google Domains</a> and start looking. Check TLDs like &quot;.io&quot; and &quot;.dev&quot;, the latter being really popular with solo contractors out there. If you plan on staying solo that&#39;s fine - but I would urge you to think about more options that could come your way... like creating some kind of app that you might want to sell.</p>
<p>Street names, place names, fictional characters - <em>just pick something</em> and let&#39;s MOVE. We have a lot of work to do and you really can&#39;t get much worse than the name <em>Google</em>, and look how that turned out!</p>
', 'Career', 5, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.468638-07', '2023-03-19 09:49:30.468638-07', NULL, NULL),
(102, 5, 'Exercise: Marketing Plan', 'exercise-marketing-plan', 'f', 'At some point you''ll need to let people know what you do, that you''re good, and that you''re worth paying. This is tough stuff, but if you don''t do it you won''t last long', '<h2 id=yeah-i-hate-it-too>Yeah, I Hate it Too</h2>
<p>Here&#39;s the simple truth: if you&#39;re not willing to spend time on marketing, <em>just stop now</em>. I need to be right up front with you on this: <em>you can&#39;t make money unless you tell people you can work for that money</em>.</p>
<p>The reason this is so painful is that it just sucks to go to Thought Leader&#39;s website and be subjected to a zillion popups with pictures of them everywhere, crossing their arms in the &quot;proud of myself&quot; stance.<br>Barf!</p>
<p>But listen: <strong>you don&#39;t need to do that</strong>. You just need to figure out how you&#39;re going to tell people about what you do so that your sould doesn&#39;t whither away. I mean... if you <em>want</em> to put pictures of yourself on your website crossing your arms... go for it. The people that do that kind of thing <strong>do it because it works</strong>. They hate stupid pop up menus too! But they get customers...</p>
<h2 id=identify>Identify</h2>
<p>The first thing we need to do is to identify who your market is. For instance: I <a href=https://bigmachine.io/products/the-imposters-handbook/>wrote a book</a> about Computer Science principles but for people without Computer Science degrees. That&#39;s a pretty well-defined niche and a very well-defined market.<br>I like writing and I like trying to take complex things and see if I can explain them in a straightforward way. If you put those two things together, I have identified my market and also my outreach.</p>
<p>As hard as it might sound, think about what you&#39;re good at. When I started out on my own, I knew I was good at three things:</p>
<ul>
<li><strong>Web sites</strong>, specifically with ASP Classic. I had run a business for years and knew the web well.</li>
<li><strong>Databases</strong>. I spent <em>years</em> running a massive database for an environmental company and then scheming them out for my tech clients.</li>
<li><strong>Product development</strong>. Clients liked to talk with me about whacky ideas, and in fact I was told more than once that my &quot;weird, off the wall nonsense&quot; helped shape my client&#39;s products.</li>
</ul>
<p>That&#39;s the <em>what</em>. Now to the <em>who</em>. 90% of the people I worked with previously were Fortune 500 companies: big telecoms, Silicon Valley giants including Google and PayPal. I felt comfortable in that world, so it&#39;s natural that I should target those people as my market.</p>
<h2 id=outreach>Outreach</h2>
<p>Now comes the hard part: <em>how do you let your who know about your what?</em> Believe it or not, there are some very obvious ways... but before I get there...</p>
<h3 id=do-you-want-out>Do You Want Out</h3>
<p>So many people I know have decided to &quot;make a fresh break&quot; and start again by going out on their own. I did this once and it was a disaster! When Ruby on Rails came out I decided I wanted to be a Ruby person, so told my friends I was looking for a Ruby job - specifically Ruby on Rails.</p>
<p>I finally got a call from an acquantance and long story short: <em>it was a total disaster</em>. I didn&#39;t understand the world I was entering (mobile startup) and also what they expected of me. I knew Rails pretty well, but not the point I should have - so let&#39;s just say that&#39;s the last time I did that.</p>
<p>A month later I returned to what I knew how to do: enterprise development using .NET. I ended up getting a contract with the largest payment gateway in the .NET space, designing and building their .NET SDK. It was <em>very</em> good money and I executed happily, which helped me <em>slowly</em> change my focus over time.</p>
<p>If you want out of what you&#39;re doing now, you have to have expertise in where you want to go. Otherwise your increased risk of failure will blow this whole thing up!</p>
<h3 id=word-of-mouth>Word of Mouth</h3>
<p>It&#39;s always going to be your best bet. So right now I want you to pop open your Trello board (or Airtable or whatever you decided to use) and write down the names of some people you can call. These are potential leads and you need to create cards to help you:</p>
<ol>
<li>Remember to call them</li>
<li>Track what was said during the call (or email/text) and then &quot;score&quot; the lead in terms of a getting work</li>
<li>Remember to thank them later on</li>
</ol>
<p>These people can be friends, old bosses, family (if you&#39;re OK with that) and people you might meet at a conference or event of some kind.<br>I know... <em>random strangers? Really?</em> Well..</p>
<h3 id=get-over-it>Get Over It</h3>
<p>Do you do good work? Do you write code that you think people should pay you for? Great! <em>Let people know this</em>. We&#39;ll get to marketing in more detail later on, but you&#39;re going to need to get over your hesitance to engage with people. </p>
<p>There&#39;s a fine line between being inquiring and being obnoxious. The worst thing you can be is <strong>neither</strong> and let this whole thing fail.<br>I&#39;ll give you some strategies later on, for now I want you to think about who you could reach out to and how. Pop that into your CRM.</p>
<h2 id=networking-and-events>Networking and Events</h2>
<p>If you don&#39;t go to any meetups you need to start now, if only to get yourself out there to see what other people are up to and how they market themselves. You can find these things anywhere, but heading over to meetup.com is your best bet. Find an event that suits you and just drop in to say hello. </p>
<p><em>Everyone is there to network</em>, and that&#39;s what you&#39;re trying to do. So write down a few meetups in your marketing plan, and include them in your overall market approach in terms of defining your niche.</p>
<p>For instance: do you find yourself wanting to go to the MongoDB meetups more than anything else? Great! There&#39;s a possible market for you.</p>
<h2 id=still-here-get-writing>Still Here? Get Writing!</h2>
<p>OK, enough babbling, hopefully you see the thing I&#39;m trying to get you to do: <em>Identify what your services are and who can use them</em>.</p>
<p>Just start writing... make stuff up if you have to. The point is that words, when they flow, tend to stitch themselves together. You just have to start with the first sentence...</p>
<blockquote>
<p>I love doing X and it would be a dream if I could do it for Y...</p>
</blockquote>
', 'Career', 6, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.470946-07', '2023-03-19 09:49:30.470946-07', NULL, NULL),
(103, 5, 'Setting Up Professional Services for Your Contracting Gig', 'setting-up-professional-services-for-your-contracting-gig', 'f', 'Trying to run a business on your own is a sure way to burn yourself out. You have to delegate certain duties to online services and third parties. It might seem like an expensive thing to do, but it’s really not.', '<p>In this section, we’ll find the help we need, including services from a CPA as well as a lawyer. In addition we’ll set up a bank account and find the basic contracts that we’ll need before we start working.</p>
', 'Career', 7, 740, '367881558', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367881558/077afe9bbc', '2023-03-19 09:49:30.472433-07', '2023-03-19 09:49:30.472433-07', NULL, NULL),
(104, 5, 'Setting Up Your Finances as a Solo Contractor', 'setting-up-your-finances-as-a-solo-contractor', 'f', 'In this section we turn our attention to your new company’s finances. It may seem intimidating, but tracking your income and expenses can be quite easy with simple to use online services.', '<p>At this point you should have a CPA, a quickbooks file setup just for you by your accountant and your business bank account. If your accountant didn’t setup your books, don’t worry – we’ll step through that in a minute.</p>
', 'Career', 8, 880, '367881633', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367881633/186a6bf10d', '2023-03-19 09:49:30.473415-07', '2023-03-19 09:49:30.473415-07', NULL, NULL),
(105, 5, 'Sample Contracts', 'sample-contracts', 'f', 'At some point you''ll need to let people know what you do, that you''re good, and that you''re worth paying. This is tough stuff, but if you don''t do it you won''t last long', '<p>Hey - did I mention that I&#39;m not a lawyer? I&#39;m not but that doesn&#39;t mean you can&#39;t look over variants of some contracts I&#39;ve used in the past. </p>
<p>You don&#39;t ever want to work without a contract and you really really don&#39;t ever want to work without getting paid! And it happens! In fact, a good friend of mine was telling me over lunch the other day how he&#39;s getting burned right now because of &quot;bank issues&quot; from a client that&#39;s also a very good friend of his.</p>
<p>This guy has been a solo programmer for 28 years. He still put himself in a perilous position because he decided to take a risk. He ended up getting paid a little bit, but he&#39;s still waiting on the last 3 months of promised wages... don&#39;t do that to yourself...</p>
<a href=https://firebasestorage.googleapis.com/v0/b/project-8588976765518720764.appspot.com/o/example_contracts.zip?alt=media&token=4b20d2e7-b5c2-407e-83a2-2e1c75b89ed2 style=color:blue>
Download these contracts</a> and get to know them!', 'Career', 9, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.474745-07', '2023-03-19 09:49:30.474745-07', NULL, NULL),
(106, 5, 'Growing Your Professional Network', 'growing-your-professional-network', 't', 'In this section we’ll look at ways to find your most important client: the very first one! We’ll get out and meet other developers, creating a legitimate network of peers. Finally, the best work is repeat work, so we’ll look at things you can do to make sure you are your client’s go to person.', '<p>In the first video of this production we addressed risk and <a href=/is-the-contract-programmer-thing-right-for-you/>whether solo contracting was something that was right for you.</a> This video should help you figure that out a bit more.</p>
<p>You can&#39;t get work if you don&#39;t know people, hopefully that&#39;s obvious by now. But <em>how do you get to know people?</em> For many of us who are introverts, this is kind of hard. There are some strategies we can use, however, to <em>grow our business network</em>, which is exactly what we&#39;re doing! It&#39;s not about going out and making friends (though, yes, that will hopefully happen too) - it&#39;s about reaching out and making sure people know you&#39;re awesome and available for work!</p>
', 'Career', 10, 475, '367884419', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367884419/22def0c6f3', '2023-03-19 09:49:30.475914-07', '2023-03-19 09:49:30.475914-07', NULL, NULL),
(107, 5, 'Branding Your Solo Contracting Business', 'branding-your-solo-contracting-business', 't', 'You need to stand out and make your virtual self look sharp and competent. This isn''t about physical looks, it''s about how you present yourself to others and the care you take in making an impression. These things matter a lot and they don''t take a whole lot of effort.', '<p>In the previous video in this series we took a look at <a href=/growing-your-professional-network/>networking and how to get to word out</a> about your business. Getting out there is only the first step, however, <em>you&#39;ve got to impress people</em>.</p>
<p>I&#39;m not talking about buying a new wardrobe, although feel free because I happen to like nice clothes... they make me happy :). I&#39;m talking about the small details that really impress potential clients like having a business card, a professional-looking blog and a business email address.</p>
<p>It takes some time, but it lets people know you&#39;re serious and that you have an eye for detail. That&#39;s important to people who are going to pay you to write code for them!</p>
', 'Career', 11, 790, '367884448', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367884448/31da391708', '2023-03-19 09:49:30.486254-07', '2023-03-19 09:49:30.486254-07', NULL, NULL),
(108, 5, 'Good Luck!', 'good-luck', 'f', 'We’ve covered a lot of ground in the last 90 minutes, and I hope you’ve seen that this process is not that intimidating. Yes, it does take a bit longer then jumping right in, but that investment of your time will hopefully result in good things later on in your career.', '<p>Thanks so much for watching this production and I sincerely hope it will help you in your future endeavors. I know you&#39;ve heard me say it so many times (and read it too), but your dedication, discipline and ability to <em>execute</em> will make all the difference.</p>
<h2 id=three-things-to-remember>Three Things to Remember</h2>
<p><strong>You will be discouraged</strong> and, probably sooner than later, you will also feel defeated before you even start. This is natural and expected, it&#39;s also very human. We can dream the wonderful dreams but when it comes to putting transitioning those dreams into something real it can be terrifying.</p>
<p>But! There is a cure for that feeling of defeat! Can you guess what it is..? It&#39;s broken record time... but the best way to get over your self-doubt is by <strong>doing something</strong>. Even the smallest step forward is self-propelling.</p>
<p>For instance: right now you might be making lists and taking notes but you haven&#39;t <em>actually</em> done anything substantive. Let&#39;s change that! Seriously, right this very second.</p>
<h2 id=getting-off-the-ground>Getting Off the Ground</h2>
<p>Let&#39;s say you might have jotted some notes for a business plan, signed up for a few services and looked online for an accountant and/or lawyer. These are great plans - but they don&#39;t amount to <em>executing</em> your vision, so are a few things I want you to do for a first, substantive step.</p>
<h3 id=register-your-domain>Register Your Domain</h3>
<p>If you haven&#39;t picked a domain yet, <em>do it right now</em>. <a href=https://domains.google.com/m/registrar/search>Here&#39;s the link</a> in case you forgot. Set a timer and pick something in the next 5 minutes. GO.</p>
<p>Once you&#39;ve done that, <a href=https://www.cloudflare.com/>sign up at Cloudflare</a> and have them serve your site for you. You&#39;ll get a free SSL certificate which is rad.</p>
<h3 id=setup-your-site>Setup Your Site</h3>
<p>Now, let&#39;s choose a platform for your site. Let&#39;s keep you focused - pick one of these:</p>
<ul>
<li><a href=https://www.squarespace.com/>Squarespace</a>. It looks nice and keeps things simple.</li>
<li><a href=https://marketplace.digitalocean.com/apps/openlitespeed-wordpress>WordPress</a>. This is what I use (the OpenLiteSpeed version) for my front-facing stuff. This is a great option as you can use some outstanding marketing tools like Thrive Architect to help you grow your online presence. Let&#39;s not get ahead of ourselves, however. WordPress is a great pick just to get off the ground.</li>
<li><a href=https://pages.github.com/>GitHub Pages</a>. This is a good option if you like playing with HTML and want things for free (which is good)</li>
</ul>
<h3 id=pay-for-your-services>Pay for Your Services</h3>
<p>I have a simple bit of advice for you on this: <strong>DO. NOT. OBSESS. ON. FREE.</strong>. <em>This is your business</em> and your focus needs to be on getting paying customers to see you and call you. Do not develop a habit of freaking out over $30/month for a service that can bring in thousands. This is easy to do, especially in the beginning.</p>
<h2 id=cant-decide-do-this>Can&#39;t Decide? Do This.</h2>
<p>Once you&#39;ve decided on your domain and registered it with Cloudflare, click that link above for the WordPress site and create a $20 image at DigitalOcean. Once that&#39;s done and you&#39;re into your site, install these plugins:</p>
<ul>
<li><a href=https://thrivethemes.com/architect/>Thrive Architect</a>. It&#39;s $67 but it will transform the way you think about your site, <em>I promise</em>. You may eventually want to get a Thrive Membership as their themes and marketing stuff is amazing - but for right now let&#39;s get you going.</li>
<li>WordFence. Search for it in the plugins directory. People suck and WordFence is a great way to keep them from hacking your site.</li>
<li>The Astra Theme. It&#39;s free and comes with some starter templates.</li>
</ul>
<p>Once your site is up, we need a few pages. Things like the services you want to provide, more about you, <strong>your resume</strong> and your blog where you&#39;re going to post professional superstar stuff later on.</p>
<p>This can be super hard to conceive, so <a href=https://blog.hubspot.com/marketing/best-personal-websites>click this link and go get started</a>.</p>
<h2 id=enough-reading-go>Enough Reading! Go!</h2>
<p>You can do this. I swear you can. I don&#39;t know you personally but I know that our industry needs really good people and if you&#39;re watching this <em>you&#39;re one of those people</em>.</p>
<p><em>Only you can make this happen</em> for yourself. Put another way: <em>you</em> are your biggest problem! But I just said you&#39;re awesome so get over yourself and get to work!</p>
<p>Good luck!</p>
', 'Career', 12, 55, '367881824', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/367884448/31da391708', '2023-03-19 09:49:30.48756-07', '2023-03-19 09:49:30.48756-07', NULL, NULL),
(109, 13, 'Welcome!', 'welcome', 'f', 'These videos have been 3 years in the making! I started this project in the spring of 2014 with a simple idea: what could I build without having to manage a server? The results were interesting, but not overly compelling. I wanted to SELL THINGS, and doing that by knitting together various services was a pain. Then came serverless and Firebase - let''s get started!', '<h2 id=welcome-and-thanks>Welcome, and Thanks!</h2>
<p>These videos have been 3 years in the making! I started this project in the spring of 2014 with a simple idea: what could I build without having to manage a server? The results were interesting, but not overly compelling. I wanted to SELL THINGS, and doing that by knitting together various services was a pain.</p>
<p>And then came AWS Lambda. It looked fascinating, but required a whole lot of knowledge about AWS. Then, in March 2017 Firebase launched Firebase Functions and I was all over it. The result is what you see here.</p>
<p>I put a lot of love into these videos and a whole lot of time. I hope it shows, and I hope you really enjoy it! You have the code that goes along with the videos, and I need to walk you through setting it all up before you dig in and try to code along with me.</p>
<h2 id=getting-set-up>Getting Set Up</h2>
<p>The web site that you see in the video was built with <a href=http://middlemanapp.com/>Middleman</a>, a static site generator that is built with Ruby. You don&#39;t need to use it. I&#39;ve prebuilt the site for you, so instead of installing and starting up Middleman you can use this:</p>
<pre><code>firebase serve
</code></pre>
<p>...which will load the prebuilt site (located in /build) and serve it locally. If you want to use Middleman, go for it and follow the install instructions on their site.</p>
<h2 id=settings>Settings</h2>
<p>You&#39;ll quickly notice, if you run the code, that much of it won&#39;t work right away. This is because you need to add some information first! Specifically you need to...</p>
<ul>
<li><a href=https://firebase.google.com/>Sign up with Firebase</a> and create a project. Once you do that you&#39;ll need to add your settings as you see in the video.</li>
<li>If you want to follow along with the Drip demo, you&#39;ll need to <a href=http://getdrip.com/>sign up with them too</a>. It&#39;s free and very, very worth it.</li>
<li>I use <a href=https://github.com/motdotla/dotenv>dotenv</a>, which is a really easy Node configuration tool that lets you set environmental variables within your project. You might see me using that at certain points in the video.</li>
</ul>
<h2 id=-and-finally-a-favor>... And Finally: A Favor</h2>
<p>I know that there&#39;s a general belief that if you put it online, expect it to be shared. As you&#39;re watching these videos I would ask you to consider their quality. It took me months to create them, and it&#39;s largely because I&#39;m a stickler for creating the best experience possible. I can&#39;t do that for free. So... please: reconsider before sharing these things. I&#39;d like to keep making these productions!</p>
', 'Course', 0, 0, NULL, NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-03-19 09:49:30.503309-07', '2023-03-19 09:49:30.503309-07', NULL, NULL),
(110, 13, 'Introduction', 'introduction', 'f', 'What is Firebase and why should you care? The whole Serverless thing is interesting, but is it worth doing? We discuss this here.', '<h2 id=lots-of-opinions-lets-see-why>Lots of Opinions, Let&#39;s See Why</h2>
<p>If you&#39;re new to the Serverless thing you might have a small opinion or two. Let&#39;s be good programmers and shelve those opinions until we&#39;ve dug in and tried it! You never know... you might like what you see.</p>
', 'Course', 1, 286, '219573146', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/219573146/fcb2c1865c', '2023-03-19 09:49:30.50513-07', '2023-03-19 09:49:30.50513-07', NULL, NULL),
(111, 13, 'Hosting', 'hosting', 'f', 'One of the very nice things about Firebase is its hosting service. It''s free and comes with SSL to boot. I like to use Middleman to help build the site out, but you don''t have to! Use whatever tools you like, and serve the files with firebase serve.', '<h2 id=about-middleman-and-your-site-generator>About Middleman and Your Site Generator</h2>
<p>When I made these videos JavaScript frameworks (like Vue and React) were around, but their site generator counterparts (Nuxt, Gatsby, etc) handn&#39;t been created yet. Hopefully you&#39;ll understand the point of this video, however, which is that you can build whatever you want and place the output into the <code>/public</code> directory.</p>
', 'Course', 2, 1759, '219608165', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/219608165/c732a3a4e0', '2023-03-19 09:49:30.505991-07', '2023-03-19 09:49:30.505991-07', NULL, NULL),
(112, 13, 'The Realtime Database', 'realtime-db', 'f', 'We get rolling with our site, building out the initial checkout service while getting to know Firebase.', '<h2 id=realtime-database-and-firestore>Realtime Database and Firestore</h2>
<p>The Firebase offering is a bit weird. It offers a &quot;Google Cloud Platform Light&quot; kind of service. When I made this video, the Realtime database was the only one they offered - recently, however, they released Firestore.</p>
<p>Firestore is much more of a document store model, whereas the realtime database is kind of like a giant document. There are differences and I hope to add a video about it soon.</p>
<h2 id=the-code>The Code</h2>
<p>You can <a href=https://github.com/bigmachine-io/firebase/tree/master/1_start_here>view the code</a> for this video up at GitHub.</p>
', 'Course', 3, 1759, '219607304', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/219607304/02074e1a71', '2023-03-19 09:49:30.506742-07', '2023-03-19 09:49:30.506742-07', NULL, NULL),
(113, 13, 'Firebase Functions', 'functions', 'f', 'Extremely simple to create with NodeJS. Simple to deploy, and fun to use, Firebase functions are incredibly flexible and fun. There are some tricks you need to know, however.', '<h2 id=more-functions-emulators-and-express>More Functions, Emulators and Express!</h2>
<p>Since I made this video back in 2016, Firebase has come a very long way. One of the really neat things they added was the ability to tie an Express application (Node web framework) into your functions and tell Firebase hosting that&#39;s where your site lives! This is a &quot;best of both worlds&quot; scenario and amounts to having a virtually free Express app powered by Functions.</p>
<p>Google also released a suite of emulators to help when building out Functions, making testing a bit nicer. Finally, they also have the notion of &quot;<a href=https://firebase.google.com/docs/functions/callable>callable</a>&quot; functions which can be invoked from the client SDK rather than an HTTP request. Fascinating stuff!</p>
<h2 id=the-code>The Code</h2>
<p>You can <a href=https://github.com/bigmachine-io/firebase/tree/master/3_add_these_for_parts_3_and_4>view the code</a> for this video up at GitHub.</p>
', 'Course', 4, 2797, '219607864', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/219607864/dd439ce976', '2023-03-19 09:49:30.507883-07', '2023-03-19 09:49:30.507883-07', NULL, NULL),
(114, 13, 'Authentication and Storage', 'auth-storage', 'f', 'In this part we tidy things up, plugging in Authentication and hooking our download service into Firebase Storage.', '<h2 id=firebase---youve-been-using-it>Firebase - You&#39;ve Been Using It!</h2>
<p>The site you&#39;re on right now is powered by Jekyll (static site generator), Vue and Firebase. I&#39;m using the Firestore DB this time instead of the realtime one and it&#39;s been great - 4 years and running!</p>
<p>I really enjoy the overall simplicity of the setup, especially when it comes to authentication and storage.</p>
<h2 id=the-code>The Code</h2>
<p>You can <a href=https://github.com/bigmachine-io/firebase/tree/master/3_add_these_for_parts_3_and_4>view the code</a> for this video up at GitHub.</p>
', 'Course', 5, 1759, '219608394', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', 'https://vimeo.com/bigmachine/download/219608394/25e445f6d2', '2023-03-19 09:49:30.515994-07', '2023-03-19 09:49:30.515994-07', NULL, NULL),
(128, 20, 'Welcome!', 'introduction', 't', 'A few things to know before we get rolling.', '<p>Woohoo! Let&#39;s get off the ground quickly as there are hours upon hours of video to watch.</p>
<h2 id=this-is-a-casual-watch>This is a casual watch</h2>
<p>I put this together so you could watch it like you might a Netflix documentary. Feel free to play along, but what I&#39;m hoping for is the feel of a pair coding session, where you watch someone build something and see the decisions they make and why.</p>
<p>If you want to follow along, please do!</p>
<h2 id=editor-and-browser>Editor and Browser</h2>
<p>I&#39;m using VS Code throughout with the Vue 3 (Volar) extension as well as Playwright later on.</p>
<h2 id=feedback>Feedback</h2>
<p>I don&#39;t think things are ever &quot;done&quot; so if you want to let me know your opinion or have a request, hit that GitHub button in the menu!</p>
', 'Foundation', 0, 165, '855792592', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:28.79518-07', '2023-06-12 12:44:28.79518-07', 'Woohoo! Let''s get off the ground quickly as there are hours upon hours of video to watch.

## This is a casual watch
I put this together so you could watch it like you might a Netflix documentary. Feel free to play along, but what I''m hoping for is the feel of a pair coding session, where you watch someone build something and see the decisions they make and why.

If you want to follow along, please do!

## Editor and Browser
I''m using VS Code throughout with the Vue 3 (Volar) extension as well as Playwright later on.

## Feedback
I don''t think things are ever done so if you want to let me know your opinion or have a request, hit that GitHub button in the menu!', NULL),
(129, 20, 'A Look at Vue and React', 'vue-react', 't', 'Many people want to know the difference between these projects. That''s what we''ll discuss in this video.', '<p>You&#39;re likely aware of Vue to some level so I figure it would be a nice idea to start right here: <em>why Vue instead of React?</em> This obviously suggests that one is quantitatively better but that&#39;s not the case: they both do the same thing.</p>
<p>React has a much larger footprint and ecosystem than Vue, which is very important, but Vue is very close behind. That said, there are more important things: like how the concepts of a framework align with your own thinking.</p>
<p>That&#39;s what we&#39;re going to dig into.</p>
', 'Foundation', 1, 383, '823469479?h=7db33c4741', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:28.887148-07', '2023-06-12 12:44:28.887148-07', 'You''re likely aware of Vue to some level so I figure it would be a nice idea to start right here: *why Vue instead of React?* This obviously suggests that one is quantitatively better but that''s not the case: they both do the same thing.

React has a much larger footprint and ecosystem than Vue, which is very important, but Vue is very close behind. That said, there are more important things: like how the concepts of a framework align with your own thinking.

That''s what we''re going to dig into.', NULL),
(130, 20, 'How Vue and Nuxt Work', 'vue-nuxt', 't', 'The basics of Vue and Nuxt', '<p>If you don&#39;t have the time or can&#39;t be asked to read up on the fundamentals of Vue and Nuxt... well here you go. In this 12 minute video we&#39;ll do a whirlwind tour of the two frameworks.</p>
', 'Foundation', 2, 763, '823440571?h=c2dae25a2a', NULL, NULL, 'fa-play', 'mdi-play-circle-outline', NULL, '2023-06-12 12:44:28.976048-07', '2023-06-12 12:44:28.976048-07', '
If you don''t have the time or can''t be asked to read up on the fundamentals of Vue and Nuxt... well here you go. In this 12 minute video we''ll do a whirlwind tour of the two frameworks.', NULL),
(131, 20, 'Meet Nuxt', 'meet-nuxt', 't', 'Let''s get to know Nuxt and why it exists.', '<p>We&#39;re going to do all of this in just a minute when we startup the walkthrough, but I wanted to make sure you know what you&#39;re looking at as I&#39;ll probably blast right through the startup &quot;stuff&quot;</p>
', 'Foundation', 3, 241, '823469417?h=5950a50fb2', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.066124-07', '2023-06-12 12:44:29.066124-07', 'We''re going to do all of this in just a minute when we startup the walkthrough, but I wanted to make sure you know what you''re looking at as I''ll probably blast right through the startup stuff', NULL),
(132, 20, 'Getting Started', 'walkthrough-start', 'f', 'We''re ready to go! The introductory stuff is out the way, let''s do the Walkthrough.', '<p>In this episode we&#39;ll get off the ground quickly and with a little repetition if you&#39;ve watched the foundation stuff.</p>
<h2 id=what-were-going-to-build>What We&#39;re Going to Build</h2>
<p>Ideally we&#39;re going to build the app that you&#39;re watching this video on! I&#39;ll have this course available in a number of locations - but the goal is that you&#39;re building what you see. </p>
<ul>
<li>A quick tour of existing applications, including my reference site</li>
<li>References and docs that you&#39;ll find useful as we go along</li>
</ul>
<h2 id=shut-up-already-lets-code>Shut Up Already, Let&#39;s Code</h2>
<p>Right, off we go! Pick a working directory and </p>
<pre><code>npx nuxi@latest init red4
cd red4
npm i
code .
</code></pre>
<p>I&#39;m using VS Code and <code>code .</code> is the shortcut for opening the current directory in it. If you&#39;re using something else, just open the directory as usual. </p>
<p>To look around, run <code>npm run dev</code>.</p>
<h2 id=install-vuetify>Install Vuetify</h2>
<p>We need to install the package and then wire it to Nuxt:</p>
<pre><code>npm install vuetify
</code></pre>
<p>Once finished, we need to add the package as a plugin to Nuxt. Inside the root of your project:</p>
<pre><code>mkdir plugins
touch plugins/vuetify.js
</code></pre>
<p>Add this code to the <code>plugins/vuetify.js</code> file:</p>
<pre><code class=language-js>import &#39;@mdi/font/css/materialdesignicons.css&#39;
import &#39;vuetify/styles&#39;

const vuetify = createVuetify({
  ssr: true,
})
</code></pre>
<p>Finally, in the root is a file called <code>nuxt.config.ts</code> and we need to tell it to include the Vuetify plugin:</p>
<pre><code class=language-js>export default defineNuxtConfig({
  telemetry: false, //add this so we don&#39;t forget
  css: [
    &quot;vuetify/lib/styles/main.sass&quot;
  ],
  build: {
    transpile: [&#39;vuetify&#39;],
  },
  vite: {
    define: {
      &#39;process.env.DEBUG&#39;: false,
    },
  },
})
</code></pre>
<h2 id=a-test-layout>A Test Layout</h2>
<p>To make sure everything looks good, pop open <code>app.vue</code> and add this:</p>
<pre><code class=language-html>&lt;template&gt;
  &lt;v-card&gt;
    &lt;v-layout&gt;
      &lt;v-app-bar title=&quot;Application bar&quot;&gt;&lt;/v-app-bar&gt;

      &lt;v-navigation-drawer&gt;
        &lt;v-list&gt;
          &lt;v-list-item title=&quot;Navigation drawer&quot;&gt;&lt;/v-list-item&gt;
        &lt;/v-list&gt;
      &lt;/v-navigation-drawer&gt;

      &lt;v-main style=&quot;min-height: 300px;&quot;&gt;&lt;/v-main&gt;
    &lt;/v-layout&gt;
  &lt;/v-card&gt;
&lt;/template&gt;
</code></pre>
', 'Getting Off the Ground', 4, 1293, '823470325?h=b7eaa14526', NULL, '60bdd7f0aba7c711fd621120fe2e542a', 'fa-play', 'mdi-play-circle-outline', NULL, '2023-06-12 12:44:29.156734-07', '2023-06-12 12:44:29.156734-07', '
In this episode we''ll get off the ground quickly and with a little repetition if you''ve watched the foundation stuff.

## What We''re Going to Build
Ideally we''re going to build the app that you''re watching this video on! I''ll have this course available in a number of locations - but the goal is that you''re building what you see. 

 - A quick tour of existing applications, including my reference site
 - References and docs that you''ll find useful as we go along

## Shut Up Already, Let''s Code
Right, off we go! Pick a working directory and 

```
npx nuxi@latest init red4
cd red4
npm i
code .
```

I''m using VS Code and `code .` is the shortcut for opening the current directory in it. If you''re using something else, just open the directory as usual. 

To look around, run `npm run dev`.

## Install Vuetify
We need to install the package and then wire it to Nuxt:

```
npm install vuetify
```

Once finished, we need to add the package as a plugin to Nuxt. Inside the root of your project:

```
mkdir plugins
touch plugins/vuetify.js
```

Add this code to the `plugins/vuetify.js` file:

```js
import ''@mdi/font/css/materialdesignicons.css''
import ''vuetify/styles''

const vuetify = createVuetify({
  ssr: true,
})
```

Finally, in the root is a file called `nuxt.config.ts` and we need to tell it to include the Vuetify plugin:

```js
export default defineNuxtConfig({
  telemetry: false, //add this so we don''t forget
  css: [
    vuetify/lib/styles/main.sass
  ],
  build: {
    transpile: [''vuetify''],
  },
  vite: {
    define: {
      ''process.env.DEBUG'': false,
    },
  },
})
```

## A Test Layout
To make sure everything looks good, pop open `app.vue` and add this:

```html
<template>
  <v-card>
    <v-layout>
      <v-app-bar title=Application bar></v-app-bar>

      <v-navigation-drawer>
        <v-list>
          <v-list-item title=Navigation drawer></v-list-item>
        </v-list>
      </v-navigation-drawer>

      <v-main style=min-height: 300px;></v-main>
    </v-layout>
  </v-card>
</template>
```', NULL),
(133, 20, 'Menus, Data-driven UI, Styling', 'menus-styling', 'f', 'We need to think about design from the very start as we''ll be called for a demo at any moment. Count on it.', '<p>Material design is OK, but it&#39;s more fun if we can use our own as we want!</p>
<h2 id=off-camera>Off Camera</h2>
<p>I added a logo and a favicon as we&#39;re going to build this &quot;outside-in&quot;. Also init&#39;d a git repo. The idea here is you can <code>git log</code> to see the commit for each episode and checkout as you need.</p>
<h2 id=material-design-options>Material Design Options</h2>
<p>We can tweak things as we need:</p>
<ul>
<li>Get to know Vuetify docs better</li>
<li>Use different design themes (1, 2 or 3)</li>
<li>Use our own font styles overriding Vuetify</li>
<li>Tweaking colors (not something I&#39;m going to do)</li>
</ul>
<h2 id=menus>Menus</h2>
<p>We need to add three and we&#39;ll start out hard-coding then move to more idiomatic ways of doing things:</p>
<ul>
<li>Main (top of nav)</li>
<li>Link to Video Page</li>
<li>Footer with Social and Site (help, terms, about and so on)</li>
</ul>
', 'Getting Off the Ground', 5, 1872, '823471367', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.24797-07', '2023-06-12 12:44:29.24797-07', 'Material design is OK, but it''s more fun if we can use our own as we want!

## Off Camera
I added a logo and a favicon as we''re going to build this outside-in. Also init''d a git repo. The idea here is you can `git log` to see the commit for each episode and checkout as you need.

## Material Design Options
We can tweak things as we need:

 - Get to know Vuetify docs better
 - Use different design themes (1, 2 or 3)
 - Use our own font styles overriding Vuetify
 - Tweaking colors (not something I''m going to do)

## Menus
We need to add three and we''ll start out hard-coding then move to more idiomatic ways of doing things:

 - Main (top of nav)
 - Link to Video Page
 - Footer with Social and Site (help, terms, about and so on)

', NULL),
(134, 20, 'Sitewide data and more menus', 'site-data', 'f', 'Plugging in Vuetify for a quick CSS win.', '<p>In this episode we&#39;re going to work with application data so we can build menus and set the title of each page</p>
<h2 id=quick-discussion-about-using-vuetify>Quick discussion about using Vuetify</h2>
<p>In the book I used Tailwind, but here I&#39;m using Vuetify... what gives?</p>
<h2 id=setting-up-appconfig>Setting up app.config</h2>
<p>Nuxt gives us a central place for application-level data, which includes:</p>
<ul>
<li>The site menu</li>
<li>Specific application links</li>
<li>Social menu</li>
<li>About/Description and Default meta &quot;stuff&quot;</li>
</ul>
<p>Every page will need this, so let&#39;s do it now!</p>
<h2 id=creating-an-a-helper-function>Creating an a helper function</h2>
<p>We&#39;ll get our first introduction to writing composables in Nuxt - little helper functions that can be used on both the client and the server.</p>
<ul>
<li>The SEO composable</li>
</ul>
', 'Getting Off the Ground', 6, 1242, '823473311', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.337034-07', '2023-06-12 12:44:29.337034-07', 'In this episode we''re going to work with application data so we can build menus and set the title of each page

## Quick discussion about using Vuetify
In the book I used Tailwind, but here I''m using Vuetify... what gives?

## Setting up app.config
Nuxt gives us a central place for application-level data, which includes:

 - The site menu
 - Specific application links
 - Social menu
 - About/Description and Default meta stuff

Every page will need this, so let''s do it now!

## Creating an a helper function
We''ll get our first introduction to writing composables in Nuxt - little helper functions that can be used on both the client and the server.

 - The SEO composable', NULL),
(135, 20, 'Components and Wireframes', 'hello-components', 'f', 'Working with components and building the home page.', '<p>Our home page is going to also act as our sales page and we&#39;ll want a strategy for how to layout out content there. We&#39;re not going to drop HTML directly, instead we&#39;re going to build out components!</p>
<h2 id=encouragement>Encouragement</h2>
<p>We&#39;re moving fast, but don&#39;t give up!</p>
<h2 id=meet-components>Meet components</h2>
<p>Everything in Vue (and therefore Nuxt) is a component!</p>
<ul>
<li>Create a <code>/components</code> directory</li>
</ul>
<h2 id=just-a-bit-about-component-design>Just a bit about component design</h2>
<p>Little reusable bits of markup and logic require a plan.</p>
<ul>
<li>Quick review of Atomic Design principles</li>
<li>We already have a Design System: Vuetify! But you should know that&#39;s what it is.</li>
<li>You can create your own system on top of it</li>
</ul>
<h2 id=wireframing-the-home-page>Wireframing the home page</h2>
<p>We&#39;re going to make sure we can show some progress!</p>
<ul>
<li>Set up a simple <code>hero</code> component</li>
<li>Elements of a &quot;good sales page&quot;</li>
</ul>
', 'Getting Off the Ground', 7, 2375, '824155566', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.423626-07', '2023-06-12 12:44:29.423626-07', 'Our home page is going to also act as our sales page and we''ll want a strategy for how to layout out content there. We''re not going to drop HTML directly, instead we''re going to build out components!

## Encouragement
We''re moving fast, but don''t give up!

## Meet components
Everything in Vue (and therefore Nuxt) is a component!

 - Create a `/components` directory

## Just a bit about component design
Little reusable bits of markup and logic require a plan.

 - Quick review of Atomic Design principles
 - We already have a Design System: Vuetify! But you should know that''s what it is.
 - You can create your own system on top of it

## Wireframing the home page
We''re going to make sure we can show some progress!

 - Set up a simple `hero` component
 - Elements of a good sales page', NULL),
(136, 20, 'Simple CMS with Nuxt Content', 'simple-cms', 'f', 'Every application needs some form of content management (CMS), so let''s not wait - we''ll plug in Nuxt Content.', '<p>We have a bunch of <em>lorem ipsum</em> but that will eventually change. We don&#39;t want to hard-code our content in our templates because Vue prefers your data (including content) to be separate! Time to investigate CMS&#39;s - this is real world stuff!</p>
<h2 id=lets-talk-about-headless-cms>Let&#39;s talk about headless CMS</h2>
<p>There are a number of ways to get content into a page that don&#39;t include hand-rolling your HTML.</p>
<ul>
<li>Services like Contentful and Prismic</li>
<li>Roll your own with Strapi</li>
<li>The simplest of the lot: Nuxt Content</li>
</ul>
<h2 id=creating-a-simple-markdown-experience>Creating a simple markdown experience</h2>
<p>We&#39;ll replace our hero content with Nuxt Content to see how easy it is to work with the system.</p>
<ul>
<li>Create a markdown document for hero</li>
<li>Get to know the document query system</li>
<li>Rob shares his opinion based on use in the wild</li>
</ul>
<h2 id=using-nuxt-content-for-all-of-our-sections>Using Nuxt Content for all of our sections</h2>
<p>Every section is a document! Weeee!</p>
<ul>
<li>Refactor our components to work with our documents</li>
<li>Tweak the query results to make things easier to use</li>
<li>Think about scaling this as the company grows</li>
</ul>
', 'Getting Off the Ground', 8, 2202, '824158145', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.518205-07', '2023-06-12 12:44:29.518205-07', 'We have a bunch of _lorem ipsum_ but that will eventually change. We don''t want to hard-code our content in our templates because Vue prefers your data (including content) to be separate! Time to investigate CMS''s - this is real world stuff!

## Let''s talk about headless CMS
There are a number of ways to get content into a page that don''t include hand-rolling your HTML.

 - Services like Contentful and Prismic
 - Roll your own with Strapi
 - The simplest of the lot: Nuxt Content

## Creating a simple markdown experience
We''ll replace our hero content with Nuxt Content to see how easy it is to work with the system.

 - Create a markdown document for hero
 - Get to know the document query system
 - Rob shares his opinion based on use in the wild

## Using Nuxt Content for all of our sections
Every section is a document! Weeee!

 - Refactor our components to work with our documents
 - Tweak the query results to make things easier to use
 - Think about scaling this as the company grows
', NULL),
(137, 20, 'Application state with Pinia', 'pinia', 'f', 'It''s time to think about a centralized state store and working with Pinia.', '<p>We’re working our way “outside in”, almost like hopping down the side of a building in Elden Ring, and we’ve reached the middle tier, descending from the components above.</p>
<h2 id=meet-pinia>Meet Pinia</h2>
<p>Pinia is an optional centralized state store for larger applications, and we’re going to need it!</p>
<ul>
<li>Install Pinia and fail!</li>
<li>Defining our first store, two ways. </li>
<li>Rob shares his opinion on which he prefers</li>
</ul>
<h2 id=creating-a-content-store>Creating a Content Store</h2>
<p>Let’s centralize how we pull content so we don’t repeat ourselves.</p>
<ul>
<li>Creating the <code>content</code> store</li>
<li>Refactoring our existing pages and components</li>
<li>Discussion: how far do we take this?</li>
</ul>
<h2 id=as-we-go-along-understanding-the-role-of-reactivity>As we go along: understanding the role of reactivity</h2>
<p>A reactive bit of data changes across the application and is a core feature of all frontend frameworks. </p>
<ul>
<li>The Reactive Pattern, quickly. Like global variables, but improved!</li>
<li>How to make something reactive in Vue, both old school and new</li>
<li>Dealing with confusion, Part 1</li>
</ul>
', 'Getting Off the Ground', 9, 1499, '824180446', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.606856-07', '2023-06-12 12:44:29.606856-07', 'We’re working our way “outside in”, almost like hopping down the side of a building in Elden Ring, and we’ve reached the middle tier, descending from the components above.

## Meet Pinia
Pinia is an optional centralized state store for larger applications, and we’re going to need it!

 - Install Pinia and fail!
 - Defining our first store, two ways. 
 - Rob shares his opinion on which he prefers

## Creating a Content Store
Let’s centralize how we pull content so we don’t repeat ourselves.
 
 - Creating the `content` store
 - Refactoring our existing pages and components
 - Discussion: how far do we take this?

## As we go along: understanding the role of reactivity
A reactive bit of data changes across the application and is a core feature of all frontend frameworks. 

 - The Reactive Pattern, quickly. Like global variables, but improved!
 - How to make something reactive in Vue, both old school and new
 - Dealing with confusion, Part 1


', NULL),
(138, 20, 'Blocking the Course Page', 'course-page-start', 'f', 'Adding content-specific components and page blocking.', '<p>We&#39;re doin it live! We&#39;re going to use an existing site as a guide to block our page, completely, before we add any data. We&#39;ll see if we can do it all in one go.</p>
<h2 id=examining-the-components-well-need>Examining the components we&#39;ll need</h2>
<p>We&#39;ll go outside in and figure out what we need:</p>
<ul>
<li>Intro to dynamic routing</li>
<li>Have a good look at the design template (which happens to be a working site)</li>
<li>Outline/note what goes where. Use whatever tool you like.</li>
<li>Jot down notes in a design plan <em>somewhere</em>. Or just stub the components?</li>
</ul>
<h2 id=the-big-stuff>The big stuff</h2>
<p>We&#39;re moving outside in, refactoring smaller as we go. We will, hopefully, move slowly and be able to back track.</p>
<ul>
<li>Block the major elements (organisms)</li>
<li>Extract the molecules</li>
<li>Take a stab at a naming convention</li>
</ul>
<h2 id=wiring-it-all-up-making-it-work>Wiring it all up, making it work</h2>
<p>We won&#39;t be using live data, but we can stub some out and see if things will move the way we like.</p>
<ul>
<li>Check the responsive design! We should do this from the start but...</li>
<li>Create the store(s) we need, add lorem data</li>
<li>Refactor, as needed</li>
</ul>
', 'The Course Page', 10, 1944, '824181665', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.693616-07', '2023-06-12 12:44:29.693616-07', 'We''re doin it live! We''re going to use an existing site as a guide to block our page, completely, before we add any data. We''ll see if we can do it all in one go.

## Examining the components we''ll need
We''ll go outside in and figure out what we need:

 - Intro to dynamic routing
 - Have a good look at the design template (which happens to be a working site)
 - Outline/note what goes where. Use whatever tool you like.
 - Jot down notes in a design plan _somewhere_. Or just stub the components?

## The big stuff
We''re moving outside in, refactoring smaller as we go. We will, hopefully, move slowly and be able to back track.
 
 - Block the major elements (organisms)
 - Extract the molecules
 - Take a stab at a naming convention

## Wiring it all up, making it work
We won''t be using live data, but we can stub some out and see if things will move the way we like.

 - Check the responsive design! We should do this from the start but...
 - Create the store(s) we need, add lorem data
 - Refactor, as needed
', NULL),
(139, 20, 'Molecules and Vuetify hell', 'vuetify-hell', 'f', 'Now let''s move on to the tough stuff: the course page. This is where the fun really starts...', '<p>We have the &quot;organisms&quot; on our page (nav bars, drawer, etc) now it&#39;s time to go a bit deeper and add more value. We&#39;ll start with a store that our design can use.</p>
<h2 id=creating-a-course-store>Creating a course store</h2>
<p>We&#39;ll be pulling data from somewhere and our components need to use it! Pinia!</p>
<ul>
<li>Faster now: declaring the store</li>
<li>Creating mock data</li>
<li>Stubbing out methods based on our design brief</li>
</ul>
<h2 id=the-top-navigation>The Top Navigation</h2>
<p>Let&#39;s fill out the top nav stuff in our <code>v-app-bar</code>:</p>
<ul>
<li>Logo and collapse</li>
<li>Course links</li>
<li>User icon</li>
</ul>
<h2 id=the-module-list-topics-and-lessons>The Module List (topics and lessons)</h2>
<p>I hate the word module but whatever. This is a list of all of the content in our course, sorted and organized by topic or category.</p>
<ul>
<li>The course nav, with title</li>
<li>The lesson nav, with completed check, free indicator, and unwatched indicator (currently a play icon in our mockup)</li>
</ul>
<h2 id=the-lesson-video-text-commands>The Lesson (video, text, commands)</h2>
<ul>
<li>The video slide (not logged in)</li>
<li>The lesson text</li>
<li>Lesson command list</li>
</ul>
', 'The Course Page', 11, 2093, '824183569', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.780586-07', '2023-06-12 12:44:29.780586-07', 'We have the organisms on our page (nav bars, drawer, etc) now it''s time to go a bit deeper and add more value. We''ll start with a store that our design can use.

## Creating a course store
We''ll be pulling data from somewhere and our components need to use it! Pinia!

 - Faster now: declaring the store
 - Creating mock data
 - Stubbing out methods based on our design brief

## The Top Navigation
Let''s fill out the top nav stuff in our `v-app-bar`:

 - Logo and collapse
 - Course links
 - User icon

## The Module List (topics and lessons)
I hate the word module but whatever. This is a list of all of the content in our course, sorted and organized by topic or category.
 
 - The course nav, with title
 - The lesson nav, with completed check, free indicator, and unwatched indicator (currently a play icon in our mockup)

## The Lesson (video, text, commands) 

 - The video slide (not logged in)
 - The lesson text
 - Lesson command list


', NULL),
(140, 20, 'Try That Again: Molecules', 'course-molecules', 'f', 'Problems are how we learna and yes, they''re frustrating, but wow the experience! It''s very valuable.', '<p>We got hung up a bit on the nav bar, but the hopefully the rest of the course page will be straightforward.</p>
<h2 id=setting-up-links-for-the-lessons>Setting up links for the lessons</h2>
<p>Our routing is in place, so let&#39;s turn on the nav!</p>
<ul>
<li>Adding a link</li>
<li>Noting which is active</li>
<li>Showing which is free</li>
</ul>
<h2 id=the-top-navigation>The Top Navigation</h2>
<p>Let&#39;s fill out the top nav stuff in our <code>v-app-bar</code>:</p>
<ul>
<li>Logo and collapse</li>
<li>Course links</li>
<li>User icon</li>
</ul>
<h2 id=the-lesson-video-text-commands>The Lesson (video, text, commands)</h2>
<ul>
<li>The video slide (not logged in)</li>
<li>The lesson text</li>
<li>Lesson command list</li>
</ul>
<h1 id=yay-for-problems>Yay for problems!</h1>
<p>It&#39;s how we learn. Or... <em>relearn</em> in my case. I got locked up for 3 hours on this, spent a chunk of my weekend trying to figure it out. Also wrote a post about it if you&#39;re interested.</p>
<h2 id=vuetify-and-nuxt-are-powerful>Vuetify and Nuxt are Powerful</h2>
<p>I can be snarky, especially when I&#39;m frustrated. That&#39;s not fair to these powerful tools!</p>
<ul>
<li>With great power comes great frustration, especially when things change so often</li>
<li>These tools do a lot for you, sometimes it&#39;s just not obvious</li>
<li>I need to be more patient</li>
</ul>
<h2 id=im-human>I&#39;m Human</h2>
<p>I am editing things out - but <em>only</em> to keep a good pace and also remove redundancy.</p>
<ul>
<li>I make ridiculous errors (spelling, omissions, etc) just like anyone</li>
<li>I get distracted trying to code and speak at the same time</li>
<li>I&#39;m doing this on nights and weekends</li>
</ul>
<h2 id=the-solution>The Solution</h2>
<p>Vuetify was trying to be helpful as I was completely overwriting the state object, <code>course</code>. This quote from someone responding to my post hit it right on the head:</p>
<blockquote>
<p>Interesting read, I’m not a Vue developer but from what I can tell this boils down to essentially a value/reference type issue? You wholesale replaced the thing be monitored rather than updating the thing being monitored? </p>
</blockquote>
<p>The solution was to use <code>Object.assign</code>, which I&#39;ll show you...</p>
<h2 id=how-did-i-actually-solve-this>How did I actually solve this?</h2>
<p>I&#39;m adding this bit after I recorded the wrapup as it might be interesting to some folks. Basically it was a process of <em>thrashing</em>, which means I tried all kinds of changes to see what broke and how. I <em>did</em> start with a step-wise process, but threw that out the window when things didn&#39;t change.</p>
<p>I went on a walk after a few hours and I kept coming back to the thought: &quot;why are only two buttons duplicated?&quot; It seemed too coincidental that they were also the ones with dynamic links (aka <code>course.discussion</code>). I replaced the code with a hard-coded value and the problem went away (<code>href=&#39;test&#39;</code>).</p>
<p>That&#39;s when I knew it had something to do with state and then the sky fell in and I realized it was a problem I had solved a few times before: using <code>Object.assign</code>.</p>
', 'The Course Page', 12, 2328, '824187322', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-12 12:44:29.869025-07', '2023-06-12 12:44:29.869025-07', 'We got hung up a bit on the nav bar, but the hopefully the rest of the course page will be straightforward.

## Setting up links for the lessons
Our routing is in place, so let''s turn on the nav!

 - Adding a link
 - Noting which is active
 - Showing which is free

## The Top Navigation
Let''s fill out the top nav stuff in our `v-app-bar`:

 - Logo and collapse
 - Course links
 - User icon

## The Lesson (video, text, commands) 

 - The video slide (not logged in)
 - The lesson text
 - Lesson command list

# Yay for problems!
It''s how we learn. Or... _relearn_ in my case. I got locked up for 3 hours on this, spent a chunk of my weekend trying to figure it out. Also wrote a post about it if you''re interested.

## Vuetify and Nuxt are Powerful
I can be snarky, especially when I''m frustrated. That''s not fair to these powerful tools!

 - With great power comes great frustration, especially when things change so often
 - These tools do a lot for you, sometimes it''s just not obvious
 - I need to be more patient

## I''m Human
I am editing things out - but _only_ to keep a good pace and also remove redundancy.

 - I make ridiculous errors (spelling, omissions, etc) just like anyone
 - I get distracted trying to code and speak at the same time
 - I''m doing this on nights and weekends

## The Solution
Vuetify was trying to be helpful as I was completely overwriting the state object, `course`. This quote from someone responding to my post hit it right on the head:

> Interesting read, I’m not a Vue developer but from what I can tell this boils down to essentially a value/reference type issue? You wholesale replaced the thing be monitored rather than updating the thing being monitored? 

The solution was to use `Object.assign`, which I''ll show you...

## How did I actually solve this?
I''m adding this bit after I recorded the wrapup as it might be interesting to some folks. Basically it was a process of _thrashing_, which means I tried all kinds of changes to see what broke and how. I _did_ start with a step-wise process, but threw that out the window when things didn''t change.

I went on a walk after a few hours and I kept coming back to the thought: why are only two buttons duplicated? It seemed too coincidental that they were also the ones with dynamic links (aka `course.discussion`). I replaced the code with a hard-coded value and the problem went away (`href=''test''`).

That''s when I knew it had something to do with state and then the sky fell in and I realized it was a problem I had solved a few times before: using `Object.assign`.', NULL),
(141, 20, 'Adding Videos', 'lesson-video-text', 'f', 'I took a small break and edited the first set of videos - I wanted to get an idea of pace! Now let''s get to the heart of the matter: videos!', '<p>We&#39;ve made our way through the first big hurdle, dealing with state management properly. Now let&#39;s add a video with lesson text, along with next/previous commands.</p>
<h2 id=quick-checkin>Quick Checkin</h2>
<p>I just edited the first 9 videos...</p>
<ul>
<li><p>Going to keep a quicker pace, less explaining</p>
</li>
<li><p>My process and why I&#39;m hitting errors</p>
</li>
<li><p>GitHub</p>
</li>
<li><p>Copilot?</p>
</li>
</ul>
<h2 id=the-video-component>The video component</h2>
<p>We&#39;ll be using Vimeo to serve our videos, but to start off we&#39;ll use a test video (Big Buck Bunny). Along the way, we&#39;ll need to be sure...</p>
<ul>
<li><p>Things layout the way we want</p>
</li>
<li><p>A slide is shown in place of the video when a user isn&#39;t logged in</p>
</li>
</ul>
<h2 id=the-page-text-with-syntax-highlighting>The page text, with syntax highlighting</h2>
<p>Our videos will need context, including code samples! Let&#39;s see how we can add styling:</p>
<ul>
<li><p>The interesting way: using Nuxt Typography</p>
</li>
<li><p>Our way: using the built-in Shiki code highlighter</p>
</li>
</ul>
<h2 id=nextprevious-commands>Next/Previous commands</h2>
<p>Every video app needs a next/previous! We&#39;ll add ours without overthinking things.</p>
<ul>
<li><p>Add the buttons to a bottom bar</p>
</li>
<li><p>Use <code>findSurround</code> to get the next and previous pages</p>
</li>
<li><p>Use our own sorting method to see which we like more.</p>
</li>
</ul>
', 'The Course Page', 13, 1285, '824189401', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-17 10:09:00.007617-07', '2023-06-17 10:09:00.007617-07', 'We''ve made our way through the first big hurdle, dealing with state management properly. Now let''s add a video with lesson text, along with next/previous commands.

## Quick Checkin

I just edited the first 9 videos...

- Going to keep a quicker pace, less explaining

- My process and why I''m hitting errors

- GitHub

- Copilot?

## The video component

We''ll be using Vimeo to serve our videos, but to start off we''ll use a test video (Big Buck Bunny). Along the way, we''ll need to be sure...

- Things layout the way we want

- A slide is shown in place of the video when a user isn''t logged in

## The page text, with syntax highlighting

Our videos will need context, including code samples! Let''s see how we can add styling:

- The interesting way: using Nuxt Typography

- Our way: using the built-in Shiki code highlighter

## Next/Previous commands

Every video app needs a next/previous! We''ll add ours without overthinking things.

- Add the buttons to a bottom bar

- Use `findSurround` to get the next and previous pages

- Use our own sorting method to see which we like more.', NULL),
(142, 20, 'Refactoring Pinia', 'pinia-refactor-next-prev', 'f', 'It''s important to avoid technical debt so we''re going to make sure we''re doing Pinia right. We''ll also keep moving forward with our course page!', '<p>It&#39;s so, so easy to make a mess but the good thing, for us, is that our code will tell us (when it starts to stink) as will Nuxt. Or Vuetify!</p>
<h2 id=refactor>Refactor</h2>
<p>We have a small bug that I didn&#39;t notice and I need to fix, which is also sparking a refactor.</p>
<ul>
<li><p>Avoiding technical debt in the name of speed</p>
</li>
<li><p>Walking carefully through the valley of frameworks</p>
</li>
</ul>
<h2 id=nextprevious-commands>Next/Previous commands</h2>
<p>Every video app needs a next/previous! We&#39;ll add ours without overthinking things.</p>
<ul>
<li><p>Add the buttons to a bottom bar</p>
</li>
<li><p>Use <code>findSurround</code> to get the next and previous pages</p>
</li>
<li><p>Use our own sorting method to see which we like more.</p>
</li>
</ul>
<h2 id=if-we-have-time-styling-pass>If we have time: styling pass</h2>
<p>Blocking will get us only so far as an excuse when we give updates at the end of our sprints. Marketing, sales, and managers don&#39;t care about our process - they want results!</p>
', 'The Course Page', 14, 1711, '837186367', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-17 10:26:24.776916-07', '2023-06-17 10:26:24.776916-07', 'It''s so, so easy to make a mess but the good thing, for us, is that our code will tell us (when it starts to stink) as will Nuxt. Or Vuetify!

## Refactor

We have a small bug that I didn''t notice and I need to fix, which is also sparking a refactor.

- Avoiding technical debt in the name of speed

- Walking carefully through the valley of frameworks

## Next/Previous commands

Every video app needs a next/previous! We''ll add ours without overthinking things.

- Add the buttons to a bottom bar

- Use `findSurround` to get the next and previous pages

- Use our own sorting method to see which we like more.

## If we have time: styling pass

Blocking will get us only so far as an excuse when we give updates at the end of our sprints. Marketing, sales, and managers don''t care about our process - they want results!', NULL),
(143, 20, 'First Pass at Styling', 'styling-session', 'f', 'It''s been my experience that dressing up a web app from day one can only be a good thing. People like looking at nice things - so let''s do that now.', '<p>We&#39;re going to get called into an unscheduled demo - count on it. Make your work shine before it happens! Plus: it drives us to completion!</p>
<h2 id=adding-a-logo>Adding a logo</h2>
<p>I did this off camera but I&#39;ll walk you through some ideas</p>
<ul>
<li>Find yourself a design app you trust</li>
<li>Some helpful resources</li>
</ul>
<h2 id=setting-colors>Setting colors</h2>
<p>Videos are much easier to watch on a dark background as light backgrounds can cause eyestrain over time. Plus, it makes the video pop!</p>
<ul>
<li>Adding gradient coloring to the lesson</li>
<li>Calling out the text</li>
<li>Adding complementary colors to the nav bits (side, top, and bottom)</li>
</ul>
<h2 id=the-progress-bar>The progress bar</h2>
<p>We don&#39;t have the data for it just yet - but let&#39;s plugin a quick progress bar as an accent!</p>
', 'The Course Page', 15, 1239, '838533510', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-29 09:17:02.462019-07', '2023-06-29 09:17:02.462019-07', 'We''re going to get called into an unscheduled demo - count on it. Make your work shine before it happens! Plus: it drives us to completion!

## Adding a logo
I did this off camera but I''ll walk you through some ideas

 - Find yourself a design app you trust
 - Some helpful resources

## Setting colors
Videos are much easier to watch on a dark background as light backgrounds can cause eyestrain over time. Plus, it makes the video pop!

 - Adding gradient coloring to the lesson
 - Calling out the text
 - Adding complementary colors to the nav bits (side, top, and bottom)

## The progress bar
We don''t have the data for it just yet - but let''s plugin a quick progress bar as an accent!', NULL),
(144, 20, 'Digging in to Vuetify Layout', 'layout-details', 'f', 'I''ve been copy/pasting my way through Vuetify, which has worked for me over the years, but I think it''s a good idea to understand the layout more.', '<p>I have a bad habit of ignoring things until they bite, which I suppose is another way of defining &quot;Agile&quot;. Let&#39;s learn a bit more about our layout!</p>
<h2 id=a-quick-tweak>A Quick Tweak</h2>
<p>I woke up in the middle of the night, like I do, and thought...</p>
<ul>
<li>Let&#39;s remove the background color of the side nav</li>
<li>I think the next/prev buttons are floating on the video, can we fix that?</li>
<li>I completely forgot to add a &quot;completed&quot; button</li>
</ul>
<h2 id=digging-in-to-application-layout-with-vuetify>Digging in to application layout with Vuetify</h2>
<p>App, layout, main, container... what goes where? I skipped over this, but we really need to know what&#39;s happening.</p>
<ul>
<li>Why does our <code>v-img</code> expand to fill the space?</li>
<li>Are we using the right layout things?</li>
</ul>
<h2 id=possible-and-quick-refactor>Possible (and quick) refactor</h2>
<p>A big challenge we have, given that we&#39;re learning this stuff, is to do our best to avoid technical debt! Let&#39;s make the changes we need now.</p>
<h2 id=post-production-errata>Post production errata</h2>
<p>Off camera I did a little more CSS work and I&#39;m taking a bit of gamble here! There&#39;s a difference between watching me work with Vuetify and watching me fumble with layouts. </p>
<p>I changed some colors around but I also found out that my transparent side nav was a bad idea on mobile devices! So I needed to do a conditional thing with Vuetify, which I found out you can do!</p>
<pre><code class=language-js>import { useDisplay } from &#39;vuetify&#39;

const bg = computed(() =&gt; {
  const { name } = useDisplay();
  switch (name.value) {
    case &#39;xs&#39;: return &quot;black&quot;
    case &#39;sm&#39;: return &quot;black&quot;
    case &#39;md&#39;: return &quot;black&quot;
    case &#39;lg&#39;: return &quot;transparent&quot;
    case &#39;xl&#39;: return &quot;transparent&quot;
    case &#39;xxl&#39;: return &quot;transparent&quot;
  }
  return &quot;transparent&quot;
});
</code></pre>
<p>I&#39;ll go over this in the next episode but wanted to put the note here. The <code>name</code> setting tells you what breakpoint is active. You have to write code for each one, as you see, but here I&#39;m able to conditionally set things, which works well.</p>
<h3 id=active-list-items>Active List Items</h3>
<p>I mentioned in the video that I would come back to the <code>active-class</code> bits but I edited that out because I struggled, once again, to get Vuetify to show what I wanted.</p>
<p>In previous versions of Vuetify I was able to use <code>active-class</code> in <code>v-list-item</code> to alter the text color and borders, but in this version of Vuetify <code>active-class</code> has an <code>active-color</code> counterpart, neither of which do what&#39;s expected.</p>
<p>Rather than faff about with CSS, I decided to move on as we have <em>tons</em> of content in front of us and what we have now is perfectly servicable.</p>
<h3 id=breakpoints-and-video-layout>Breakpoints and Video Layout</h3>
<p>The weirdness I was having with the video layout not conforming to the container was due to the screen size I&#39;m recording at, which is 1910x1080. This straddled the line between breakpoints and if I was off by a pixel, the xxl breakpoint was triggered, making the video span full width. If I was under that point, 1280 was honored. I like this, so I&#39;m leaving it.</p>
<h3 id=using-spacers-for-alignment>Using spacers for alignment</h3>
<p>I forgot about this trick! You can use <code>v-spacer</code> to force center alignment for things and also do some tricky spacing if needed. I wanted to center-align my next/previous buttons so I popped in some <code>v-spacers</code> (attributes removed for legibility):</p>
<pre><code class=language-html>&lt;v-app-bar&gt;
  &lt;v-spacer&gt;&lt;/v-spacer&gt;
  &lt;v-btn &gt;Completed&lt;/v-btn&gt;
  &lt;v-spacer&gt;&lt;/v-spacer&gt;
  &lt;v-btn&gt;Prev&lt;/v-btn&gt;
  &lt;v-btn&gt;Next&lt;/v-btn&gt;
  &lt;v-spacer&gt;&lt;/v-spacer&gt;
&lt;/v-app-bar&gt;
</code></pre>
', 'The Course Page', 16, 1268, '838532800', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-29 09:19:28.232788-07', '2023-06-29 09:19:28.232788-07', 'I have a bad habit of ignoring things until they bite, which I suppose is another way of defining Agile. Let''s learn a bit more about our layout!

## A Quick Tweak
I woke up in the middle of the night, like I do, and thought...

 - Let''s remove the background color of the side nav
 - I think the next/prev buttons are floating on the video, can we fix that?
 - I completely forgot to add a completed button

## Digging in to application layout with Vuetify
App, layout, main, container... what goes where? I skipped over this, but we really need to know what''s happening.

 - Why does our `v-img` expand to fill the space?
 - Are we using the right layout things?

## Possible (and quick) refactor
A big challenge we have, given that we''re learning this stuff, is to do our best to avoid technical debt! Let''s make the changes we need now.

## Post production errata
Off camera I did a little more CSS work and I''m taking a bit of gamble here! There''s a difference between watching me work with Vuetify and watching me fumble with layouts. 

I changed some colors around but I also found out that my transparent side nav was a bad idea on mobile devices! So I needed to do a conditional thing with Vuetify, which I found out you can do!

```js
import { useDisplay } from ''vuetify''

const bg = computed(() => {
  const { name } = useDisplay();
  switch (name.value) {
    case ''xs'': return black
    case ''sm'': return black
    case ''md'': return black
    case ''lg'': return transparent
    case ''xl'': return transparent
    case ''xxl'': return transparent
  }
  return transparent
});
```

I''ll go over this in the next episode but wanted to put the note here. The `name` setting tells you what breakpoint is active. You have to write code for each one, as you see, but here I''m able to conditionally set things, which works well.

### Active List Items
I mentioned in the video that I would come back to the `active-class` bits but I edited that out because I struggled, once again, to get Vuetify to show what I wanted.

In previous versions of Vuetify I was able to use `active-class` in `v-list-item` to alter the text color and borders, but in this version of Vuetify `active-class` has an `active-color` counterpart, neither of which do what''s expected.

Rather than faff about with CSS, I decided to move on as we have *tons* of content in front of us and what we have now is perfectly servicable.

### Breakpoints and Video Layout
The weirdness I was having with the video layout not conforming to the container was due to the screen size I''m recording at, which is 1910x1080. This straddled the line between breakpoints and if I was off by a pixel, the xxl breakpoint was triggered, making the video span full width. If I was under that point, 1280 was honored. I like this, so I''m leaving it.

### Using spacers for alignment
I forgot about this trick! You can use `v-spacer` to force center alignment for things and also do some tricky spacing if needed. I wanted to center-align my next/previous buttons so I popped in some `v-spacers` (attributes removed for legibility):

```html
<v-app-bar>
  <v-spacer></v-spacer>
  <v-btn >Completed</v-btn>
  <v-spacer></v-spacer>
  <v-btn>Prev</v-btn>
  <v-btn>Next</v-btn>
  <v-spacer></v-spacer>
</v-app-bar>
```', NULL),
(145, 20, 'Authentication, Part 1', 'auth-part-1', 'f', 'Can''t show a video to just anyone, can we? Let''s start down the road of adding authentication to the app.', '<p>We need to know who are viewer is so we can show them their video! That means we need to plugin authentication.</p>
<h2 id=authentication-in-frontend-land>Authentication in Frontend Land</h2>
<p>We have two applications we need to think about in terms of auth: frontend and backend. Ideally the auth scheme will be seamless between both!</p>
<ul>
<li>Moving away from cookies to JWTs</li>
<li>A quick review of JWTs and how they work</li>
<li>MFA, 2FA, OMFG</li>
</ul>
<h2 id=services-vs-home-rolled>Services vs. Home-rolled</h2>
<p>We can do so much more with Auth these days! Here are some services to consider...</p>
<ul>
<li>Auth0 and Okta</li>
<li>Hanko</li>
<li>Firebase and Supabase</li>
</ul>
<h2 id=hello-nitro>Hello Nitro!</h2>
<p>We&#39;ll dig in and leverage the built-in server that comes with Nuxt: Nitro.</p>
<ul>
<li>File-based routing, using fun convention</li>
<li>Sending an auth code</li>
<li>Verifying an auth code</li>
</ul>
<h2 id=some-opinion-lets-ditch-passwords>Some Opinion: let&#39;s ditch passwords</h2>
<p>I&#39;ve run my own business for the last 15 years and the best decision I made was to ditch passwords (when I can). Browsers and phones are very well equipped when it comes to authenticators and biometrics - let&#39;s use them!</p>
<h2 id=code-to-help>Code to Help</h2>
<p>I whipped out some commands at the start of this episode in the console - here they are:</p>
<pre><code class=language-sh>mkdir server &amp;&amp; cd server
mkdir api
mkdir lib
touch lib/smtp
mkdir api/auth
touch api/auth/send-link.js
touch api/auth/validate-code.js


# Modules
npm install nodemailer dotenv jsonwebtoken
</code></pre>
<p>I also created an SMTP service, which is this:</p>
<pre><code class=language-js>import * as dotenv from &#39;dotenv&#39;
dotenv.config()
import nodemailer from &quot;nodemailer&quot;;

const client = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: 465,
  secure: true,
  pool: true,
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS
  }
});

export async function sendMail(args){
  await client.sendMail(args);
}
</code></pre>
', 'Authentication', 17, 1933, '839356334', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-06-29 09:22:05.564579-07', '2023-06-29 09:22:05.564579-07', 'We need to know who are viewer is so we can show them their video! That means we need to plugin authentication.

## Authentication in Frontend Land
We have two applications we need to think about in terms of auth: frontend and backend. Ideally the auth scheme will be seamless between both!

 - Moving away from cookies to JWTs
 - A quick review of JWTs and how they work
 - MFA, 2FA, OMFG

## Services vs. Home-rolled
We can do so much more with Auth these days! Here are some services to consider...

 - Auth0 and Okta
 - Hanko
 - Firebase and Supabase

## Hello Nitro!
We''ll dig in and leverage the built-in server that comes with Nuxt: Nitro.

 - File-based routing, using fun convention
 - Sending an auth code
 - Verifying an auth code

## Some Opinion: let''s ditch passwords
I''ve run my own business for the last 15 years and the best decision I made was to ditch passwords (when I can). Browsers and phones are very well equipped when it comes to authenticators and biometrics - let''s use them!

## Code to Help
I whipped out some commands at the start of this episode in the console - here they are:

```sh
mkdir server && cd server
mkdir api
mkdir lib
touch lib/smtp
mkdir api/auth
touch api/auth/send-link.js
touch api/auth/validate-code.js


# Modules
npm install nodemailer dotenv jsonwebtoken
```

I also created an SMTP service, which is this:

```js
import * as dotenv from ''dotenv''
dotenv.config()
import nodemailer from nodemailer;

const client = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: 465,
  secure: true,
  pool: true,
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS
  }
});

export async function sendMail(args){
  await client.sendMail(args);
}
```', NULL),
(146, 20, 'Authentication, Part 2', 'auth-part-2', 'f', 'Now that we know what JWTs are, let''s plug ''em in!', '<p>We took a good first stab at authentication using JWTs, now let&#39;s implement it! Things are bound to come up, pushing us to refine the API.</p>
<h2 id=quick-checkin-re-prep-and-notes>Quick Checkin RE Prep and Notes</h2>
<p>I&#39;ve been trying to focus on the &quot;real world walkthrough&quot; angle and it&#39;s not easy. I do write things down and have &quot;ready code&quot; - let&#39;s see what that means.</p>
<ul>
<li>Where the SMTP service came from</li>
<li>Doin it live?</li>
<li>I would love to hear from you</li>
</ul>
<h2 id=creating-a-modal-using-vuetify>Creating a Modal using Vuetify</h2>
<p>The vision here is to allow the user to login from anywhere, using out <code>auth</code> store to hold their information and deal with our API.</p>
<ul>
<li>Creating the modal</li>
<li>Adding the email, registration and code prompts</li>
<li>Handling success</li>
</ul>
<h2 id=refactor-if-needed>Refactor, If Needed!</h2>
<p>I have a feeling I&#39;ll need to change a few things with the API, maybe not. We also need to discuss our JWT approach.</p>
', 'Authentication', 18, 2071, '839356868', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-07-15 11:01:44.814016-07', '2023-07-15 11:01:44.814016-07', 'We took a good first stab at authentication using JWTs, now let''s implement it! Things are bound to come up, pushing us to refine the API.

## Quick Checkin RE Prep and Notes
I''ve been trying to focus on the real world walkthrough angle and it''s not easy. I do write things down and have ready code - let''s see what that means.

 - Where the SMTP service came from
 - Doin it live?
 - I would love to hear from you

## Creating a Modal using Vuetify
The vision here is to allow the user to login from anywhere, using out `auth` store to hold their information and deal with our API.

 - Creating the modal
 - Adding the email, registration and code prompts
 - Handling success

## Refactor, If Needed!
I have a feeling I''ll need to change a few things with the API, maybe not. We also need to discuss our JWT approach.', NULL),
(147, 20, 'Authentication, Part 3', 'auth-part-3', 'f', 'We''re finishing up the UI (I hope), ideally not getting stuck this time!', '<p>Got a little stuck with things last time, which is fine - it happens every time I use Vue 3!</p>
<h2 id=testing-hello>Testing? Hello?</h2>
<p>Yes, testing is always a good idea! Unfortunately...</p>
<h2 id=formalizing-state-for-the-form>Formalizing state for the form</h2>
<p>We&#39;re beyond simple boolean checks for the state of our modal as we need to transition between:</p>
<ul>
<li>Email prompt</li>
<li>Registration if not recognized</li>
<li>Code input</li>
</ul>
<h2 id=adding-a-logout-feature>Adding a logout feature</h2>
<p>I don&#39;t ever logout of web sites but I&#39;m sure there&#39;s a use case for this.</p>
<h2 id=round-things-out>Round things out</h2>
<p>We have two app bars right now which is OK, but we&#39;re at a point where we should think about collapsing things.</p>
<ul>
<li>Let&#39;s see if we can use slots!</li>
<li>Add a loader icon to the send link button</li>
</ul>
', 'Authentication', 19, 1370, '845568672', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-07-15 11:03:45.483797-07', '2023-07-15 11:03:45.483797-07', 'Got a little stuck with things last time, which is fine - it happens every time I use Vue 3!

## Testing? Hello?
Yes, testing is always a good idea! Unfortunately...

## Formalizing state for the form
We''re beyond simple boolean checks for the state of our modal as we need to transition between:

 - Email prompt
 - Registration if not recognized
 - Code input

## Adding a logout feature
I don''t ever logout of web sites but I''m sure there''s a use case for this.

## Round things out
We have two app bars right now which is OK, but we''re at a point where we should think about collapsing things.

 - Let''s see if we can use slots!
 - Add a loader icon to the send link button
', NULL),
(148, 20, 'Authentication, Part 4', 'auth-part-4', 'f', 'Going a little slower than I wanted, but that''s how it goes innit?', '<p>The customer can login, but now what? We need to update the UI and make sure they can watch the videos they&#39;ve selected.</p>
<h2 id=setting-up-gravatar>Setting Up Gravatar</h2>
<p>We have John the Placeholder in now - let&#39;s formalize this:</p>
<ul>
<li>Choosing when, and where, to create an avatar using gravatar</li>
<li>Conditional display</li>
<li>Showing the login</li>
</ul>
<h2 id=access-rules>Access Rules</h2>
<p>When our user is logged in we need a way to know if they can watch a given video:</p>
<ul>
<li>Creating an API call for authorization</li>
<li>Free videos are always watchable by anyone, logged in or not</li>
</ul>
<h2 id=oh-yeah-logging-out>Oh Yeah... Logging Out</h2>
<p>What happens when a user logs out? I was supposed to do this a few episodes ago...</p>
<ul>
<li>Add a logout button</li>
</ul>
', 'Authentication', 20, 1654, '840218102', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-07-15 11:05:18.512474-07', '2023-07-15 11:05:18.512474-07', 'The customer can login, but now what? We need to update the UI and make sure they can watch the videos they''ve selected.

## Setting Up Gravatar
We have John the Placeholder in now - let''s formalize this:

 - Choosing when, and where, to create an avatar using gravatar
 - Conditional display
 - Showing the login

## Access Rules
When our user is logged in we need a way to know if they can watch a given video:

 - Creating an API call for authorization
 - Free videos are always watchable by anyone, logged in or not

## Oh Yeah... Logging Out
What happens when a user logs out? I was supposed to do this a few episodes ago...

 - Add a logout button
', NULL),
(150, 20, 'Authorization, Part 1', 'authorization-1', 'f', 'In this episode we''ll dig in to Sequelize, the Node.js ORM that will power our API.', '<p>We can&#39;t escape it: we need a database! We have lots of choices but I&#39;m going to go with what I would really do, so here we go!</p>
<h2 id=considerations>Considerations</h2>
<p>How do we want to store our data and, more importantly, how should we get started?</p>
<ul>
<li>Keep ignoring it and use something like <code>json-server</code></li>
<li>Use a hosted system that&#39;s easy, like Supabase or Firebase</li>
<li>Roll up our sleeves and start building our models</li>
</ul>
<p>I don&#39;t like the idea of writing code I know I&#39;ll throw away, so maybe we go with the 3rd option. Which leaves the question...</p>
<h2 id=why-not-firebase-or-supabase>Why Not Firebase or Supabase?</h2>
<p>Short answer: these are great choices which I&#39;ll get into later, but only if you understand:</p>
<ul>
<li>They replace your entire backend and API</li>
<li>Security rules! So easy to mess up.</li>
<li>They also replace your application state, in some ways (if you go full realtime)</li>
</ul>
<h2 id=my-user-code>My User Code</h2>
<p>I have some code ready to go that I added to the project and we&#39;ll walk through</p>
<h2 id=sequelize-snippets>Sequelize Snippets</h2>
<p>I use a few snippets for VS Code and here they are:</p>
<pre><code class=language-json>&quot;Sequelize TEXT&quot;: {
        &quot;prefix&quot;: &quot;mft&quot;,
        &quot;body&quot; : [
            &quot;$0: DataTypes.TEXT,&quot;,
        ]
    },
    &quot;Sequelize field&quot;: {
        &quot;prefix&quot;: &quot;mf&quot;,
        &quot;body&quot; : [
            &quot;$0: {&quot;,
            &quot;  type: DataTypes.TEXT,&quot;,
            &quot;  allowNull: false,&quot;,
            &quot;},&quot;,
        ]
    },
    &quot;Sequelize money&quot;: {
        &quot;prefix&quot;: &quot;mfm&quot;,
        &quot;body&quot; : [
            &quot;$0: {&quot;,
            &quot;  type: \&quot;numeric(10,2)\&quot;,&quot;,
            &quot;  allowNull: false,&quot;,
            &quot;  defaultValue: 0,&quot;,
            &quot;},&quot;,
        ]
    },
    &quot;Sequelize Model&quot; : {
        &quot;prefix&quot;: &quot;mod&quot;,
        &quot;body&quot; : [
            &quot;const { Model, DataTypes } = require(&#39;sequelize&#39;);&quot;,
            &quot;class $1 extends Model{}&quot;,
            &quot;exports.init = function(sequelize){&quot;,
            &quot;  $1.init({&quot;,
            &quot;    $2: {&quot;,
            &quot;      type: DataTypes.TEXT,&quot;,
            &quot;      allowNull: false,&quot;,
            &quot;      unique: true&quot;,
            &quot;    },&quot;,
            &quot;    }, {&quot;,
            &quot;     sequelize,&quot;,
            &quot;     underscored: true,&quot;,
            &quot;     timestamps: false,&quot;,
            &quot;     hooks : {&quot;,
            &quot;       //https://github.com/sequelize/sequelize/blob/v6/src/hooks.js#L7&quot;,
            &quot;    }&quot;,
            &quot;  });&quot;,
            &quot;  return { $1 };&quot;,
            &quot;}&quot;,
        ]
    }
</code></pre>
', 'Authorization', 21, 1471, '851975351', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-05 18:11:49.373053-07', '2023-08-05 18:11:49.373053-07', 'We can''t escape it: we need a database! We have lots of choices but I''m going to go with what I would really do, so here we go!

## Considerations
How do we want to store our data and, more importantly, how should we get started?

 - Keep ignoring it and use something like `json-server`
 - Use a hosted system that''s easy, like Supabase or Firebase
 - Roll up our sleeves and start building our models

I don''t like the idea of writing code I know I''ll throw away, so maybe we go with the 3rd option. Which leaves the question...

## Why Not Firebase or Supabase?
Short answer: these are great choices which I''ll get into later, but only if you understand:

 - They replace your entire backend and API
 - Security rules! So easy to mess up.
 - They also replace your application state, in some ways (if you go full realtime)

## My User Code
I have some code ready to go that I added to the project and we''ll walk through

## Sequelize Snippets

I use a few snippets for VS Code and here they are:

```json
Sequelize TEXT: {
		prefix: mft,
		body : [
			$0: DataTypes.TEXT,,
		]
	},
	Sequelize field: {
		prefix: mf,
		body : [
			$0: {,
			  type: DataTypes.TEXT,,
			  allowNull: false,,
			},,
		]
	},
	Sequelize money: {
		prefix: mfm,
		body : [
			$0: {,
			  type: \numeric(10,2)\,,
			  allowNull: false,,
			  defaultValue: 0,,
			},,
		]
	},
	Sequelize Model : {
		prefix: mod,
		body : [
			const { Model, DataTypes } = require(''sequelize'');,
			class $1 extends Model{},
			exports.init = function(sequelize){,
			  $1.init({,
			    $2: {,
			      type: DataTypes.TEXT,,
			      allowNull: false,,
			      unique: true,
			    },,
			    }, {,
			     sequelize,,
			     underscored: true,,
			     timestamps: false,,
			     hooks : {,
			       //https://github.com/sequelize/sequelize/blob/v6/src/hooks.js#L7,
			    },
			  });,
			  return { $1 };,
			},
		]
	}
```
', NULL),
(151, 20, 'Authorization, Part 2', 'authorization-2', 'f', 'We have most of our model build out, let''s plug it in.', '<p>In this episode we&#39;re going to wire up the login process, end to end. We&#39;ll adjust a few things along the way, as needed.</p>
<h2 id=finishing-the-validator>Finishing the Validator</h2>
<p>I stubbed out a few things in the <code>validate-code</code> handler, so it&#39;s likely I&#39;ll need to rethink what I&#39;m doing...</p>
<ul>
<li>Have a look at the existing code</li>
<li>Add our <code>User</code> model and wire it up</li>
</ul>
<h2 id=creating-seeds>Creating Seeds</h2>
<p>We&#39;re working in development mode now, which means we&#39;ll need to seed our database with our dev data. </p>
<ul>
<li>Create a <code>seed</code> task we can use as needed</li>
<li>Add test data for <code>User</code> and <code>Product</code></li>
</ul>
<h2 id=the-authorized-payload>The Authorized Payload</h2>
<p>Finally, we&#39;re at the point where we can ping our API to see if our user is authorized for a given video. We can noodle on this for hours, or we could do the simplest thing... but what&#39;s that?</p>
<ul>
<li>All course/lesson info goes in the DB</li>
<li>Only lesson/video info goes in the DB and we deal with dual data stores</li>
</ul>
', 'Authorization', 22, 1905, '850672517', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-05 18:13:14.582379-07', '2023-08-05 18:13:14.582379-07', 'In this episode we''re going to wire up the login process, end to end. We''ll adjust a few things along the way, as needed.

## Finishing the Validator
I stubbed out a few things in the `validate-code` handler, so it''s likely I''ll need to rethink what I''m doing...

 - Have a look at the existing code
 - Add our `User` model and wire it up

## Creating Seeds
We''re working in development mode now, which means we''ll need to seed our database with our dev data. 

 - Create a `seed` task we can use as needed
 - Add test data for `User` and `Product`

## The Authorized Payload
Finally, we''re at the point where we can ping our API to see if our user is authorized for a given video. We can noodle on this for hours, or we could do the simplest thing... but what''s that?

 - All course/lesson info goes in the DB
 - Only lesson/video info goes in the DB and we deal with dual data stores

', NULL),
(152, 20, 'Authorization, Part 3', 'authorization-3', 'f', '', '<p>In this episode things go very pear-shaped. I had <em>thought</em> that I would be wrapping up Authorization completely, but I was absolutely wrong about that.</p>
<p>As a result, I lost the README notes due to my own haste, trying to get things to work. It doesn&#39;t matter anyway as I&#39;m about to throw the whole thing out in the next episode.</p>
', 'Authorization', 23, 1642, '850675741', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-05 18:17:06.667564-07', '2023-08-05 18:17:06.667564-07', 'In this episode things go very pear-shaped. I had _thought_ that I would be wrapping up Authorization completely, but I was absolutely wrong about that.

As a result, I lost the README notes due to my own haste, trying to get things to work. It doesn''t matter anyway as I''m about to throw the whole thing out in the next episode.', NULL),
(153, 20, 'Hello Supabase!', 'supabase-intro', 'f', 'Things went to hell in the last episode, let''s get back on track.', '<p>It happens to all of us: <strong>everything explodes and we need to rethink</strong>. That&#39;s what happened to me, so it&#39;s time to ensure that we ship something, which means using an external service to get off the ground.</p>
<h2 id=off-camera>Off Camera</h2>
<ul>
<li>Changed the Completed/Prev/Next buttons</li>
</ul>
<h2 id=lets-stop-and-think>Let&#39;s Stop and Think</h2>
<p>It&#39;s the Great Tempation of every programmer: <em>I could rebuild this thing over the weekend</em>. That&#39;s not what&#39;s happening here.</p>
<p>Every application gets to a &quot;tipping point&quot; and rarely, in my experience, do we ever do things righ the first time. If you do... you&#39;re rad.</p>
<p>This is where we are. </p>
<h2 id=alternatives-to-consider>Alternatives to Consider</h2>
<p>I&#39;ve mentioned these things before, but it&#39;s time to seriously consider...</p>
<ul>
<li>A hosted backend, like Pocketbase, Supabase or Firebase</li>
<li>A more complete backend API</li>
<li>A hosted auth solution</li>
</ul>
', 'Supabase', 24, 1558, '850678539', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-05 18:20:23.104127-07', '2023-08-05 18:20:23.104127-07', 'It happens to all of us: **everything explodes and we need to rethink**. That''s what happened to me, so it''s time to ensure that we ship something, which means using an external service to get off the ground.

## Off Camera
 - Changed the Completed/Prev/Next buttons

## Let''s Stop and Think
It''s the Great Tempation of every programmer: _I could rebuild this thing over the weekend_. That''s not what''s happening here.

Every application gets to a tipping point and rarely, in my experience, do we ever do things righ the first time. If you do... you''re rad.

This is where we are. 

## Alternatives to Consider
I''ve mentioned these things before, but it''s time to seriously consider...

 - A hosted backend, like Pocketbase, Supabase or Firebase
 - A more complete backend API
 - A hosted auth solution



', NULL),
(154, 20, 'Supabase Authentication', 'supabase-auth', 'f', 'In this video we roll our auth scheme over to Supabase', '<p>We can&#39;t query our store unless we know who the user is, so let&#39;s add that quickly.</p>
<h2 id=adding-auth>Adding Auth</h2>
<p>Follow <a href=https://supabase.com/docs/guides/getting-started/tutorials/with-nuxt-3>the Supabase docs</a> and add authentication to our app.</p>
<ul>
<li>Work in a branch, of course!</li>
<li>Just using email link for now</li>
<li>Replace our current auth and blow up some code!</li>
</ul>
<h2 id=creating-an-api-abstraction>Creating an API Abstraction</h2>
<p>We don&#39;t want Supabase code littered throughout the app so let&#39;s be sure to centralize it somewhere, in case we have to swerve later.</p>
<ul>
<li>Create an API store (?)</li>
</ul>
', 'Supabase', 25, 1125, '851953392', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-18 10:31:32.858004-07', '2023-08-18 10:31:32.858004-07', 'We can''t query our store unless we know who the user is, so let''s add that quickly.

## Adding Auth
Follow [the Supabase docs](https://supabase.com/docs/guides/getting-started/tutorials/with-nuxt-3) and add authentication to our app.

 - Work in a branch, of course!
 - Just using email link for now
 - Replace our current auth and blow up some code!

## Creating an API Abstraction
We don''t want Supabase code littered throughout the app so let''s be sure to centralize it somewhere, in case we have to swerve later.

 - Create an API store (?)
', NULL),
(155, 20, 'The Full Rollover', 'supabase-final', 'f', 'In this video we finish rolling over to Supabase', '<p>Let&#39;s tear through this episode, shall we! We already have the UI in place, we just need to flip over the data.</p>
<h2 id=rolling-in-videos>Rolling in Videos</h2>
<p>We&#39;re using local content for the lesson data, now let&#39;s roll in videos with Vimeo IDs.</p>
<ul>
<li>Adding setters/getters for videos</li>
<li>Updating the course nav, progress and video components</li>
</ul>
<h2 id=checking-for-completed>Checking For Completed</h2>
<p>If we have time...</p>
<ul>
<li>Adding setters/getters for completed</li>
<li>Updating the course nav, progress and videos with completed info</li>
</ul>
', 'Supabase', 26, 1948, '852192116', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-18 10:35:09.72015-07', '2023-08-18 10:35:09.72015-07', 'Let''s tear through this episode, shall we! We already have the UI in place, we just need to flip over the data.

## Rolling in Videos
We''re using local content for the lesson data, now let''s roll in videos with Vimeo IDs.

 - Adding setters/getters for videos
 - Updating the course nav, progress and video components

## Checking For Completed
If we have time...

 - Adding setters/getters for completed
 - Updating the course nav, progress and videos with completed info

', NULL),
(156, 20, 'Meet Stripe', 'stripe-hello', 'f', 'We need to process payments, so let''s hook up Stripe', '<p>It&#39;s time to plugin Stripe! In this episode we&#39;ll dig in to the payment processor and see how it can help take over a massive chunk of our application.</p>
<p>Unfortunately I forgot to commit the README but there&#39;s not much there anyway!</p>
', 'Ship It!', 27, 1082, '853095011', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-18 10:38:58.572278-07', '2023-08-18 10:38:58.572278-07', 'It''s time to plugin Stripe! In this episode we''ll dig in to the payment processor and see how it can help take over a massive chunk of our application.

Unfortunately I forgot to commit the README but there''s not much there anyway!', NULL),
(157, 20, 'Creating the Stripe Receiver', 'stripe-webhook', 'f', 'We need a webhook receiver so we know when people bought something!', '<p>Stripe is going to notify us when a sale happens, which means we need to have a receiver, somewhere.</p>
<h2 id=the-webhook>The Webhook</h2>
<p>We have a simple task:</p>
<ul>
<li>Save the ping (as <code>JSONB</code>)</li>
<li>Figure out what was bought and then authorize the course for the user</li>
</ul>
<h2 id=cleaning-up>Cleaning Up</h2>
<p>We wiped out some code by moving to Supabase, so let&#39;s start by cleaning a few things out.</p>
<h2 id=supabase-edge-functions>Supabase Edge Functions</h2>
<p>One of the simpler things we can do, I hope, it to use Supabase edge functions. We&#39;ll get to know them and see what&#39;s involved.</p>
<h2 id=our-own-api>Our Own API</h2>
<p>We could also use our own API, which means we can&#39;t deploy this as a static app. Is this a better choice?</p>
', 'Ship It!', 28, 2647, '853096070', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-18 10:40:37.517231-07', '2023-08-18 10:40:37.517231-07', 'Stripe is going to notify us when a sale happens, which means we need to have a receiver, somewhere.

## The Webhook
We have a simple task:

 - Save the ping (as `JSONB`)
 - Figure out what was bought and then authorize the course for the user

## Cleaning Up
We wiped out some code by moving to Supabase, so let''s start by cleaning a few things out.

## Supabase Edge Functions
One of the simpler things we can do, I hope, it to use Supabase edge functions. We''ll get to know them and see what''s involved.

## Our Own API
We could also use our own API, which means we can''t deploy this as a static app. Is this a better choice?', NULL),
(158, 20, 'Deploying to Netlify', 'netlify', 'f', 'We''re ready to roll - let''s ship!', '', 'Ship It!', 29, 1322, '853098911', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-18 10:41:45.435982-07', '2023-08-18 10:41:45.435982-07', '', NULL),
(159, 20, 'Using Firebase', 'firebase', 'f', 'Let''s see what it takes to roll our site to Firebase', '<p>Firebase has been around for many years and is loved by many, including myself! With a little abstraction, it can be extremely helpful.</p>
<h2 id=setting-up-the-project-at-firebase>Setting Up the Project at Firebase</h2>
<p>We&#39;ll set things up and have a look around, then get the configuration bits so we can get our project going.</p>
<h2 id=wiring-firebase-to-our-project>Wiring Firebase to Our Project</h2>
<p>We&#39;ll have the same issue we had with Supabase: Firebase is a <em>client only</em> kind of thing, so let&#39;s make sure we get setup properly.</p>
<h2 id=adding-authentication>Adding Authentication</h2>
<p>It comes with Firebase, so let&#39;s add it in! We&#39;ll use the magic link, just like we are now.</p>
<h2 id=adding-some-abstraction>Adding Some Abstraction</h2>
<p>We don&#39;t want Firebase &quot;stuff&quot; littered throughout the application, so let&#39;s make sure we abstract it somehow.</p>
<h2 id=creating-the-collections>Creating the Collections</h2>
<p>Firebase is a document store but, just like Supabase, you need to build things with an API and rules in mind. Our focus: make it shallow and flat! We&#39;ll set up our seed to load up the documents.</p>
<h2 id=applying-rules>Applying Rules</h2>
<p>Just like Supabase, we need to make sure that requests for data are locked down. This will inform how we structure out system.</p>
<h2 id=setting-up-hosting-and-shipping>Setting Up Hosting and Shipping!</h2>
<p>Unlike Supabase, Firebase has hosting with a free SSL cert. We&#39;ll set it up and then tune up our project for Firebase deployment.</p>
', 'Case Studies', 30, 6699, '855121633', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-18 10:44:54.066508-07', '2023-08-18 10:44:54.066508-07', 'Firebase has been around for many years and is loved by many, including myself! With a little abstraction, it can be extremely helpful.

## Setting Up the Project at Firebase
We''ll set things up and have a look around, then get the configuration bits so we can get our project going.

## Wiring Firebase to Our Project
We''ll have the same issue we had with Supabase: Firebase is a _client only_ kind of thing, so let''s make sure we get setup properly.

## Adding Authentication
It comes with Firebase, so let''s add it in! We''ll use the magic link, just like we are now.

## Adding Some Abstraction
We don''t want Firebase stuff littered throughout the application, so let''s make sure we abstract it somehow.

## Creating the Collections
Firebase is a document store but, just like Supabase, you need to build things with an API and rules in mind. Our focus: make it shallow and flat! We''ll set up our seed to load up the documents.

## Applying Rules
Just like Supabase, we need to make sure that requests for data are locked down. This will inform how we structure out system.

## Setting Up Hosting and Shipping!
Unlike Supabase, Firebase has hosting with a free SSL cert. We''ll set it up and then tune up our project for Firebase deployment.
', NULL),
(160, 20, 'Testing with Playwright', 'playwright', 't', 'I''ve avoided testing until now - let''s fix that.', '<p>I&#39;m a big fan of testing things - especially end-to-end (e2e). Let&#39;s see how Playwright can help us automate our login and video checks.</p>
<p>The focus will be: <em>great, but how do I actually use this thing?</em></p>
<h2 id=off-camera>Off Camera</h2>
<p>Setup a test user with Supabase and a new login page (I have to) as we have no way to authenticate our user otherwise.</p>
<h2 id=setting-up-playwright>Setting Up Playwright</h2>
<p>We&#39;ll do the needful and see how Playwright works:</p>
<ul>
<li>Install Playwright, showing both ways (VS Code Extension and CLI)</li>
<li>Look through the config, tweaking to make it a bit more usable</li>
<li>Have a gander at the examples</li>
<li>Understand how Locaters work and what makes UI testing so brittle</li>
</ul>
<h2 id=authentication-issues>Authentication Issues</h2>
<p>Our tests need to know who the user is, so we&#39;ll plug in authentication and discuss how this would work in automated tests (it won&#39;t and shouldn&#39;t)</p>
<h2 id=running-tests>Running Tests</h2>
<p>Lots of ways to run tests:</p>
<ul>
<li>VS Code Extension (don&#39;t like)</li>
<li>The CLI (it&#39;s OK)</li>
<li>The UI tool (it&#39;s great)</li>
</ul>
<h2 id=robs-opinion>Rob&#39;s Opinion</h2>
<p>I have lots of opinions on tests and testing, and I&#39;m happy to share</p>
<h2 id=snippets>Snippets</h2>
<p>I have a number of snippets I like to use because I like to write tests by hand. Hope you find them useful!</p>
<pre><code class=language-json>&quot;Playwright&quot;:{
        &quot;prefix&quot;: &quot;pw&quot;,
        &quot;body&quot;: [
            &quot;const { test, expect } = require(&#39;@playwright/test&#39;);\r\n&quot;,
            &quot;test.describe(\&quot;$1\&quot;, () =&gt; {&quot;,
            &quot;\ttest.beforeEach(async ({page}) =&gt; {&quot;,
            &quot;\t\tawait page.goto(&#39;&#39;)&quot;,
            &quot;\t});&quot;,
            &quot;\ttest(\&quot;$2\&quot;, async ({page}) =&gt; {&quot;,
            &quot;\t\t$0&quot;,
            &quot;\t});&quot;,
            &quot;});&quot;
        ]
    },
    &quot;Playwright describe&quot; : {
        &quot;prefix&quot;: &quot;pwd&quot;,
        &quot;body&quot;: [
            &quot;test.describe(\&quot;$1\&quot;, () =&gt; {&quot;,
            &quot;  $0&quot;,
            &quot;});&quot;
        ]
    },
    &quot;Playwright label&quot; : {
        &quot;prefix&quot;: &quot;pwlbl&quot;,
        &quot;body&quot;: [
            &quot;const $0 = await page.getByLabel(\&quot;$1\&quot;);&quot;
        ]
    },
    &quot;Playwright id&quot; : {
        &quot;prefix&quot;: &quot;pwid&quot;,
        &quot;body&quot;: [
            &quot;const $0 = await page.locator(\&quot;#$1\&quot;);&quot;
        ]
    },
    &quot;Playwright test id&quot; : {
        &quot;prefix&quot;: &quot;pwtid&quot;,
        &quot;body&quot;: [
            &quot;const $0 = await page.getByTestId(\&quot;$1\&quot;);&quot;
        ]
    },
    &quot;Playwright role&quot; : {
        &quot;prefix&quot;: &quot;pwrole&quot;,
        &quot;body&quot;: [
            &quot;const $0 = await page.getByRole(&#39;$1&#39;, { name: &#39;$2&#39; });&quot;
        ]
    },
</code></pre>
', 'Case Studies', 31, 3663, '855233885', NULL, '', 'fa-play', 'mdi-play-circle-outline', '', '2023-08-18 10:48:10.591613-07', '2023-08-18 10:48:10.591613-07', 'I''m a big fan of testing things - especially end-to-end (e2e). Let''s see how Playwright can help us automate our login and video checks.

The focus will be: _great, but how do I actually use this thing?_

## Off Camera
Setup a test user with Supabase and a new login page (I have to) as we have no way to authenticate our user otherwise.

## Setting Up Playwright
We''ll do the needful and see how Playwright works:

 - Install Playwright, showing both ways (VS Code Extension and CLI)
 - Look through the config, tweaking to make it a bit more usable
 - Have a gander at the examples
 - Understand how Locaters work and what makes UI testing so brittle

## Authentication Issues
Our tests need to know who the user is, so we''ll plug in authentication and discuss how this would work in automated tests (it won''t and shouldn''t)

## Running Tests
Lots of ways to run tests:

 - VS Code Extension (don''t like)
 - The CLI (it''s OK)
 - The UI tool (it''s great)

## Rob''s Opinion
I have lots of opinions on tests and testing, and I''m happy to share

## Snippets
I have a number of snippets I like to use because I like to write tests by hand. Hope you find them useful!

```json
Playwright:{
		prefix: pw,
		body: [
			const { test, expect } = require(''@playwright/test'');\r\n,
			test.describe(\$1\, () => {,
			\ttest.beforeEach(async ({page}) => {,
			\t\tawait page.goto(''''),
			\t});,
			\ttest(\$2\, async ({page}) => {,
			\t\t$0,
			\t});,
			});
		]
	},
	Playwright describe : {
		prefix: pwd,
		body: [
			test.describe(\$1\, () => {,
			  $0,
			});
		]
	},
	Playwright label : {
		prefix: pwlbl,
		body: [
			const $0 = await page.getByLabel(\$1\);
		]
	},
	Playwright id : {
		prefix: pwid,
		body: [
			const $0 = await page.locator(\#$1\);
		]
	},
	Playwright test id : {
		prefix: pwtid,
		body: [
			const $0 = await page.getByTestId(\$1\);
		]
	},
	Playwright role : {
		prefix: pwrole,
		body: [
			const $0 = await page.getByRole(''$1'', { name: ''$2'' });
		]
	},
```', NULL);

