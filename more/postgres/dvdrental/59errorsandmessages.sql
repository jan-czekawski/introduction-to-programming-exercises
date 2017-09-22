-- to raise a message
RAISE level format;

-- different messages at curr time
DO $$
BEGIN
  RAISE INFO 'information message %', now();
  RAISE LOG 'log message %', now();
  RAISE DEBUG 'debug message %', now();
  RAISE WARNING 'warning message %', now();
  RAISE NOTICE 'notice message %', now();
END $$

-- raises duplicate email error message
DO $$
DECLARE
  email VARCHAR (255) := 'info@postgrestutorial.com';
BEGIN
  -- CHECK EMAIL
  -- report email duplicate
  RAISE EXCEPTION 'Duplicate email: %', email
  USING HINT = 'Check the email again';
END $$;

-- raise SQLSTATE and it's corresponding condition
DO $$
BEGIN
--...
  RAISE SQLSTATE '22108';
END $$;

DO $$
BEGIN
--...
  RAISE invalid_regular_expression;
END $$;

-- USE ASSERT (SINCE 9.5)
DO $$
DECLARE
  counter integer := -1; -- if you change counter to not negative it will raise assert failed error
BEGIN
  ASSERT counter < 0, 'Expect counter starts with 0';
END $$;