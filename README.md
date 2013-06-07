This is [Gittip](https://www.gittip.com/), a weekly gift exchange.


Quick Start
===========

```
$ git clone git@github.com:gittip/www.gittip.com.git
$ cd www.gittip.com
$ make run
```


Table of Contents
=================

 - [Installation](#installation)
  - [Dependencies](#dependencies)
  - [Building and Launching](#building-and-launching)
  - [Help!](#help)
 - [Configuration](#configuration)
 - [Testing](#testing-)
 - [Setting up a Database](#local-database-setup)
 - [API](#api)
 - [Glossary](#glossary)
 - [See Also](#see-also)


Installation
============

Thanks for hacking on Gittip! Be sure to review
[CONTRIBUTING](https://github.com/gittip/www.gittip.com/blob/master/CONTRIBUTING.md#readme)
as well if that's what you're planning to do.

Dependencies
------------

The only hard requirement on your system is [Python
2.7](http://python.org/download/releases/2.7.4/).

All library dependencies are bundled in the repo (under `vendor/`) and by
default the app is configured to use a Postgres instance in the cloud.


Building and Launching
----------------------

Once you've installed Python and Postgres and set up a database, you can use
make to build and launch Gittip:

    $ make run

If you don't have make, look at the Makefile to see what steps you need
to perform to build and launch Gittip. The Makefile is pretty simple and
straightforward.

All Python dependencies (including virtualenv) are bundled with Gittip in the
vendor/ directory. Gittip is designed so that you don't manage its
virtualenv directly and you don't download its dependencies at build
time.

If Gittip launches successfully it will look like this:

```
$ make run
./env/bin/swaddle local.env ./env/bin/aspen \
                --www_root=www/ \
                --project_root=.. \
                --show_tracebacks=yes \
                --changes_reload=yes \
                --network_address=:8537
[SWADDLE] Skipping line: .
[SWADDLE] Skipping line: .
[SWADDLE] Skipping line: .
[SWADDLE] Skipping line: .
[SWADDLE] Skipping line: .
pid-12508 thread-140735090330816 (MainThread) Reading configuration from defaults, environment, and command line.
pid-12508 thread-140735090330816 (MainThread)   changes_reload         False                          default
pid-12508 thread-140735090330816 (MainThread)   changes_reload         True                           command line option --changes_reload=yes
pid-12508 thread-140735090330816 (MainThread)   charset_dynamic        UTF-8                          default
pid-12508 thread-140735090330816 (MainThread)   charset_static         None                           default
pid-12508 thread-140735090330816 (MainThread)   configuration_scripts  []                             default
pid-12508 thread-140735090330816 (MainThread)   indices                [u'index.html', u'index.json', u'index'] default
pid-12508 thread-140735090330816 (MainThread)   list_directories       False                          default
pid-12508 thread-140735090330816 (MainThread)   logging_threshold      0                              default
pid-12508 thread-140735090330816 (MainThread)   media_type_default     text/plain                     default
pid-12508 thread-140735090330816 (MainThread)   media_type_json        application/json               default
pid-12508 thread-140735090330816 (MainThread)   network_address        ((u'0.0.0.0', 8080), 2)        default
pid-12508 thread-140735090330816 (MainThread)   network_address        ((u'0.0.0.0', 8537), 2)        command line option --network_address=:8537
pid-12508 thread-140735090330816 (MainThread)   network_engine         cherrypy                       default
pid-12508 thread-140735090330816 (MainThread)   project_root           None                           default
pid-12508 thread-140735090330816 (MainThread)   project_root           ..                             command line option --project_root=..
pid-12508 thread-140735090330816 (MainThread)   renderer_default       tornado                        default
pid-12508 thread-140735090330816 (MainThread)   show_tracebacks        False                          default
pid-12508 thread-140735090330816 (MainThread)   show_tracebacks        True                           command line option --show_tracebacks=yes
pid-12508 thread-140735090330816 (MainThread)   unavailable            0                              default
pid-12508 thread-140735090330816 (MainThread)   www_root               None                           default
pid-12508 thread-140735090330816 (MainThread)   www_root               www/                           command line option --www_root=www/
pid-12508 thread-140735090330816 (MainThread) project_root is relative: '..'.
pid-12508 thread-140735090330816 (MainThread) project_root set to /Your/path/to/www.gittip.com.
pid-12508 thread-140735090330816 (MainThread) Renderers (*ed are unavailable, CAPS is default):
pid-12508 thread-140735090330816 (MainThread)   TORNADO
pid-12508 thread-140735090330816 (MainThread)  *pystache         ImportError: No module named pystache
pid-12508 thread-140735090330816 (MainThread)   stdlib_template
pid-12508 thread-140735090330816 (MainThread)   stdlib_format
pid-12508 thread-140735090330816 (MainThread)  *jinja2           ImportError: No module named jinja2
pid-12508 thread-140735090330816 (MainThread)   stdlib_percent
pid-12508 thread-140735090330816 (MainThread) Starting cherrypy engine.
pid-12508 thread-140735090330816 (MainThread) Greetings, program! Welcome to port 8537.
pid-12508 thread-140735090330816 (MainThread) Aspen will restart when configuration scripts or Python modules change.
pid-12508 thread-140735090330816 (MainThread) Starting up Aspen website.
```

You should then find this in your browser at
[http://localhost:8537/](http://localhost:8537/):

![Success](https://raw.github.com/gittip/www.gittip.com/master/img-src/success.png)

Congratulations! Sign in using Twitter or GitHub and you're off and
running. At some point, try [running the test suite](#testing-).


Help!
-----

If you get stuck somewhere along the way, you can find help in the #gittip
channel on [Freenode](http://webchat.freenode.net/) or in the [issue
tracker](/gittip/www.gittip.com/issues/new) here on GitHub. If all else fails
ping [@whit537](https://twitter.com/whit537) on Twitter or email
[chad@gittip.com](mailto:chad@gittip.com).

Thanks for installing Gittip! :smiley:


Configuration
=============

When using `make run`, Gittip's execution environment is defined in a
`local.env` file, which is not included in the source code repo. If you `make
run` you'll have one generated for you, which you can then tweak as needed.
Here's the default, which is also contained in default_local.env:

    CANONICAL_HOST=
    CANONICAL_SCHEME=http
    DATABASE_URL=postgres://gittip@localhost/gittip
    DATABASE_MAXCONN=10
    STRIPE_SECRET_API_KEY=1
    STRIPE_PUBLISHABLE_API_KEY=1
    BALANCED_API_SECRET=90bb3648ca0a11e1a977026ba7e239a9
    GITHUB_CLIENT_ID=3785a9ac30df99feeef5
    GITHUB_CLIENT_SECRET=e69825fafa163a0b0b6d2424c107a49333d46985
    GITHUB_CALLBACK=http://localhost:8537/on/github/associate
    TWITTER_CONSUMER_KEY=QBB9vEhxO4DFiieRF68zTA
    TWITTER_CONSUMER_SECRET=mUymh1hVMiQdMQbduQFYRi79EYYVeOZGrhj27H59H78
    TWITTER_CALLBACK=http://127.0.0.1:8537/on/twitter/associate

The `BALANCED_API_SECRET` is a test marketplace. To generate a new secret for
your own testing run this command:

    curl -X POST https://api.balancedpayments.com/v1/api_keys | grep secret

Grab that secret and also create a new marketplace to test against:

    curl -X POST https://api.balancedpayments.com/v1/marketplaces -u <your_secret>:

The site works without this, except for the credit card page. Visit the
[Balanced Documentation](https://www.balancedpayments.com/docs) if you want to
know more about creating marketplaces.

The GITHUB_* keys are for a gittip-dev application in the Gittip organization
on Github. It points back to localhost:8537, which is where Gittip will be
running if you start it locally with `make run`. Similarly with the TWITTER_*
keys, but there they required us to spell it `127.0.0.1`.

You probably don't need it, but at one point I had to set this to get
psycopg2 working on Mac OS with EnterpriseDB's Postgres 9.1 installer:

    DYLD_LIBRARY_PATH=/Library/PostgreSQL/9.1/lib

If you wish to use different username or database name for the database, you
should change the `DATABASE_URL` using the following format:

    DATABASE_URL=postgres://<username>@localhost/<database name>


Testing [![Testing](https://secure.travis-ci.org/gittip/www.gittip.com.png)](http://travis-ci.org/gittip/www.gittip.com)
=======

Please write unit tests for all new code and all code you change.
Gittip's test suite is designed for the nosetests test runner (maybe it
also works with py.test?), and uses module-level test functions, with a context
manager for managing testing state. As a rule of thumb, each test case should
perform one assertion.

Assuming you have make, the easiest way to run the test suite is:

    $ make test

However, the test suite deletes data in all tables in the public schema of the
database configured in your testing environment, and as a safety precaution, we
require the following key and value to be set in said environment:

    YES_PLEASE_DELETE_ALL_MY_DATA_VERY_OFTEN=Pretty please, with sugar on top.

`make test` will not set this for you. Run `make tests/env` and then edit that
file and manually add that key=value, then `make test` will work. Even just
importing the gittip.testing module will trigger deletion of all data. Without
this safety precaution, an attacker could try sneaking `import gittip.testing`
into a commit. Once their changeset was deployed, we would have ... problems.
Of course, they could also remove the check in the same or even a different
commit. Of course, they could also sneak in whatever the heck code they wanted
to try to sneak in.

To invoke nosetests directly you should use the `swaddle` utility that comes
with Aspen. First `make tests/env`, edit it as noted above, and then:

    [gittip] $ cd tests/
    [gittip] $ swaddle env ../env/bin/nosetests



Now, you need to setup the database.


Local Database Setup
--------------------

For advanced development and testing databse changes, you need to configure
authentication and set up a gittip database.

You need [Postgres](http://www.postgresql.org/download/). We're working
on [porting](https://github.com/gittip/www.gittip.com/issues?milestone=28&state=open)
Gittip from raw SQL to a declarative ORM with SQLAlchemy. After that we may be
able to remove the hard dependency on Postgres so you can use SQLite in
development, but for now you need Postgres.

The best version of Postgres to use is 9.2, because that's what is being
run in production at Heroku. Version 9.1 is the second-best, because Gittip
uses the [hstore](http://www.postgresql.org/docs/9.2/static/hstore.html)
extension for unstructured data, and that isn't bundled with earlier
versions than 9.1. If you're on a Mac, maybe try out Heroku's
[Postgres.app](http://www.postgresql.org/download/). If installing using a
package manager, you may need several packages. On Ubuntu and Debian, the
required packages are: postgresql (base), libpq5-dev (includes headers needed
to build the psycopg2 Python library), and postgresql-contrib (includes
hstore).


### Authentication

If you already have a &ldquo;role&rdquo; (Postgres user) that you'd like
to use, you can do so by editing `DATABASE_URL` in the generated local.env
file. You can also change the database name there. See
[Configuration](#configuration) for more information.

Otherwise, you should add a role that matches your OS username, and make sure
it's a superuser role and has login privileges. Here's a sample
invocation of the createuser executable that comes with Postgres that will do
this for you, assuming that a &ldquo;postgres&rdquo; superuser was already
created as part of initial installation:

    $ sudo -u postgres createuser --superuser $USER

Set the authentication method to &ldquo;trust&rdquo; in pg_hba.conf for all
local connections and host connections from localhost. For this, ensure that
the file contains these lines:

    local   all             all                                     trust
    host    all             all             127.0.0.1/32            trust
    host    all             all             ::1/128                 trust

Reload Postgres using pg_ctl for changes to take effect.


### Schema

Once Postgres is set up, run:

    $ ./makedb.sh

That will create a new gittip superuser and a gittip database (with UTC as the
default timezone), populated with structure from ./schema.sql. To change the
name of the database and/or user, pass them on the command line (you'll
need to modify the `DATABASE_URL` environment variable as well; see
[Configuration](#configuration) below):

    $ ./makedb.sh mygittip myuser

If you only pass one argument it will be used for both dbname and owner role:

    $ ./makedb.sh gittip-test

You're also able to specify an alternate host, though this will require you to
specify the previous two options as well:

    $ ./makedb.sh mygittip myuser dbserver.com


The schema for the Gittip.com database is defined in schema.sql. It should be
considered append-only. The idea is that this is the log of DDL that
we've run against the production database. You should never change
commands that have already been run. New DDL will be (manually) run against the
production database as part of deployment.

### Example data

The gittip database created in the last step is empty. To populate it with
some fake data, so that more of the site is functional, run this command:

    $ make fake_data

### Notes for Mac OS X users

If when running the tests you see errors of the form:

    psycopg2.OperationalError: FATAL:  sorry, too many clients already

You will need to configure Postgres to accept more connections. You can do this
by editing your `postgresql.conf`, and setting:

    max_connections = 40

To get this to work you will also need to change your kernel's shared memory
parameters. You can do this by running these shell commands:

    sudo sysctl -w kern.sysv.shmmax=8388608
    sudo sysctl -w kern.sysv.shmall=2048

You will need to restart Postgres for the max_connections parameter to
take effect. Once restarted, the test suite should pass for you. These changes
will not persist after a reboot, so you will have to set these again after
a reboot.

API
===

The Gittip API is comprised of these endpoints:

 - **[/about/paydays.json](https://www.gittip.com/about/paydays.json)**
   ([source](https://github.com/gittip/www.gittip.com/tree/master/www/about/paydays.json))&mdash;Returns an array of
    objects, one per week, showing aggregate numbers over time. The
    [charts](https://www.gittip.com/about/charts.html) page uses this.

 - **[/about/stats.json](https://www.gittip.com/about/stats.json)**
   ([source](https://github.com/gittip/www.gittip.com/tree/master/www/about/stats))&mdash;Returns an object giving a
    point-in-time snapshot of Gittip. The
    [stats](https://www.gittip.com/about/stats.html) page displays the same
    info.

 - **/`%username`/public.json**
   ([example](https://www.gittip.com/whit537/public.json),
    [source](https://github.com/gittip/www.gittip.com/tree/master/www/%25username/public.json))&mdash;Returns
    an object with these keys:

    - "receiving"&mdash;an estimate of the amount the given participant will
      receive this week

    - "my_tip"&mdash;logged-in user's tip to the Gittip participant in
      question; possible values are:

        - `undefined` (key not present)&mdash;there is no logged-in user
        - "self"&mdash;logged-in user is the participant in question
        - `null`&mdash;user has never tipped this participant
        - "0.00"&mdash;user used to tip this participant
        - "3.00"&mdash;user tips this participant the given amount
        <br><br>

    - "goal"&mdash;funding goal of the given participant; possible values are:

        - `undefined` (key not present)&mdash;participant is a patron (or has 0 as the goal)
        - `null`&mdash;participant is grateful for gifts, but doesn't have a specific funding goal
        - "100.00"&mdash;participant's goal is to receive the given amount per week
        <br><br>

    - "elsewhere"&mdash;participant's connected accounts elsewhere; returns an object with these keys:

        - "bitbucket"&mdash;participant's Bitbucket account; possible values are:
            - `undefined` (key not present)&mdash;no Bitbucket account connected
            - `https://bitbucket.org/api/1.0/users/%bitbucket_username`
        - "github"&mdash;participant's GitHub account; possible values are:
            - `undefined` (key not present)&mdash;no GitHub account connected
            - `https://api.github.com/users/%github_username`
        - "twitter"&mdash;participant's Twitter account; possible values are:
            - `undefined` (key not present)&mdash;no Twitter account connected
            - `https://api.twitter.com/1.1/users/show.json?id=%twitter_immutable_id&include_entities=1`


Glossary
========

**Account Elsewhere** - An entity's registration on a platform other than
Gittip (e.g., Twitter).

**Entity** - An entity.

**Participant** - An entity registered with Gittip.

**User** - A person using the Gittip website. Can be authenticated or
anonymous. If authenticated, the user is guaranteed to also be a participant.


See Also
========

Here's a list of projects we're aware of in the crowd-funding
space. Something missing? Ping [@whit537](https://twitter.com/whit537) on
Twitter or [edit the file](https://github.com/gittip/www.gittip.com/edit/master/README.md)
yourself (add your link at the end). :grinning:

*Note: there are comprehensive directories that can complement this list,
such as [startingtrends.com's](http://www.startingtrends.com/crowdfunding-directory/)
and [crowdsourcing.org's](http://www.crowdsourcing.org/directory)*

 - [Kickstarter](http://www.kickstarter.com/) - crowdfunding campaigns
 - [Flattr](http://flattr.com/) - micro-donations (flat monthly rate)
 - [TipTheWeb](http://tiptheweb.org/) - micro-donations
 - [IndieGoGo](http://www.indiegogo.com/) - crowdfunding campaigns (partial funding allowed)
 - [PledgeMusic](http://www.pledgemusic.com/) - crowdfunding for musicians
 - [Propster](https://propster.me/)
 - [Kachingle](http://kachingle.com/)
 - [Venmo](https://venmo.com/) - transactions among friends (US only)
 - [Snoball](https://www.snoball.com/) - link events or actions as triggers for micro-donations
 - [Pledgie](http://pledgie.com/) - crowdfunding campaigns
 - [HumbleBundle](http://www.humblebundle.com/)
 - [CrowdTilt](https://www.crowdtilt.com/) - crowdfunding campaigns
 - [NetworkForGood](http://www1.networkforgood.org/)
 - [AnyFu](http://anyfu.com/) - hire an expert for one-on-one, screen-share work sessions
 - [OpenOfficeHours](http://ohours.org/)
 - [VideoVivoApp](http://videovivoapp.com/)
 - [TipJoy](http://techcrunch.com/2009/08/20/tipjoy-heads-to-the-deadpool/) [discontinued]
 - [HopeMob](http://hopemob.org/)
 - [AwesomeFoundation](http://www.awesomefoundation.org/)
 - [CrowdRise](http://www.crowdrise.com/)
 - [ChipIn](http://www.chipin.com/)
 - [Fundable](http://www.fundable.com/) - fund start-up companies
 - [ModestNeeds](https://www.modestneeds.org/) - crowdfunding campaigns in support of the &ldquo;working poor&rdquo;
 - [FreedomSponsors](http://www.freedomsponsors.org/) - Crowdfunding Free Software, one issue at a time
 - [GumRoad](https://gumroad.com/)
 - [MacHeist](http://macheist.com/)
 - [Prosper](http://www.prosper.com/) - peer-to-peer lending
 - [Togather](http://togather.me/)
 - [PaySwarm](http://payswarm.com/) - open payment protocol
 - [Gitbo](http://git.bo/) - another implementation of the bounty model
 - [Affero](http://www.affero.com/) - old skool attempt &ldquo;to bring a culture of patronage to the Internet&rdquo;
 - [ShareAGift](http://www.shareagift.com) - one-off, crowd-sourced cash gifts
 - [GoFundMe](http://www.gofundme.com/) - derpy-looking platform that [reaches normal people](http://pittsburgh.cbslocal.com/2013/02/19/crowdfunding-growing-in-popularity-as-fundraising-tool/) (my dad emailed this link to me)
 - [DonorsChoose.org](http://www.donorschoose.org/) - crowd-funded school
    supplies; Alexis Ohanian
    [likes it](http://www.donorschoose.org/AlexisOnCNN).
 - [Catincan](https://www.catincan.com/) - FOSS bounty site
 - [Bountysource](https://www.bountysource.com/) - FOSS bounty site
 - [IssueHunter](http://issuehunter.co/) - FOSS bounty site
 - [TinyPass](http://www.tinypass.com/) - Soft paywall, used by e.g. [Daily Dish](http://dish.andrewsullivan.com/)
 - [Patreon](http://www.patreon.com/) - Patronage model for content creators(!)
 - [WhyNotMe](http://www.whynotme.me/) - "Give as a group to any non-profit in America"
 - [LoveMachine](http://web.archive.org/web/20110214110248/http://sendlove.us/trial/faq.php) - "the cool new employee recognition system" (supposedly came out of Linden Lab)
