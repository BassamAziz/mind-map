# Mind Map
A map of topics. A tree.
Look at the schema at `db/schema.rb`

## What does it do

 - A user can have many mind maps.
 - Each mind map is a tree. a root topic that has sub topics which in turn have their own sub topics.
        
## How to use it
  Check the specs, there you will find use cases for:
   - constructing a mind map
   - listing the maps of a user
   - searching maps by topic titles

## SQL queries
 - 1.0. a SQL query that returns the best performing day of 2016 in terms of total daily revenue.
    ```
    SELECT date_trunc('day', issue_date) "day", sum(amount) "sum_per_day"
   from payments
   where extract(year from issue_date) = 2016
   group by day
   ORDER BY sum_per_day desc limit 1;
   ```
 - 2.1. please check the schema in db/schema.rb
 - 2.2. Being given the ID of the root topic, a query to select all the root children in a mind map.
   assuming the the given `ID = 1`:

   `select * from topics where parent_id = 1;`
 
 - 2.3. Being given the ID of the root topic, write a query to select all the level 2 topics.

   `select * from topics l2 join topics l1 on l2.parent_id = l1.id where l1.parent_id = 1;`

 - 3.0. OOP - Mind map:

   please check the classes structure in https://github.com/BassamAziz/mind-map/tree/master/app/models
   and the specs for the functionalities required in https://github.com/BassamAziz/mind-map/blob/master/spec/models/topic_spec.rb
