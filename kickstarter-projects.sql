use [Kickstarter projects];

select *
from dbo.[ks-projects-201801]

-- count the number of all prjects that succeded 
select category,name,state
from dbo.[ks-projects-201801]
where state = 'successful'
group by name,category,state
order by name

-- 133,845 companies succeded

-- what category had the most number of projects that succeeded and failed
select 
	category,
	count(*) AS total_projects
from dbo.[ks-projects-201801]
where state = 'successful'
group by category
order by count(*) desc

-- what is the number of live projects
select COUNT(*) AS live_projects
from dbo.[ks-projects-201801]
where state = 'live'


-- what projects achieved their funding goals
select name,category,goal,state,usd_goal_real
from dbo.[ks-projects-201801]
where usd_goal_real >= goal

-- which projects had 0 backers and succeded
select name,category,state,backers
from dbo.[ks-projects-201801]
where backers <= 0 and state ='successful'

-- from which country did projects succeed  the most
SELECT
    country,
    COUNT(*) AS successful_projects
FROM
    dbo.[ks-projects-201801]
WHERE
    state = 'successful'
GROUP BY
    country
ORDER BY
    successful_projects DESC;
-- what is the date range of the projects
select MAX(deadline) AS last_Date,MIN(deadline) AS first_date
from dbo.[ks-projects-201801]