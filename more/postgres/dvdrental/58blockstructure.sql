-- functions have following block syntax:
[ <<label>> ]
[ DECLARE 
  declarations]
BEGIN
  statements;
...
END [ label ];

-- "DO" doesn't belong to the block (used to execute anonymous block)
DO $$
<< first_block >> -- label
DECLARE
  counter integer := 0; -- declare var
BEGIN
  counter := counter + 1; -- increment it
  RAISE NOTICE 'The current value of counter is %', counter; -- output var value
END first_block $$;

-- outer blocks and subblocks
DO $$
<< outer_block >> -- label
DECLARE
  counter integer := 0; -- counter in outer block
BEGIN
  counter := counter + 1; -- incremented counter in outer
  RAISE NOTICE 'The current value of counter is %', counter;

  DECLARE
    counter integer := 0; -- counter in subblock
  BEGIN
    counter := counter + 10; -- incremented (by 10) counter in subblock
    RAISE NOTICE 'The current value of counter in the subblock is %', counter;
    RAISE NOTICE 'The current value of counter in the outer block is %', outer_block.counter; -- use block label to qualify its name
  END;

  RAISE NOTICE 'The current value of counter in the outer block is %', counter;
END outer_block $$;