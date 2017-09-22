-- constant named vat and calculates selling price
DO $$
DECLARE
  VAT CONSTANT numeric := 0.1;
  net_price numeric := 20.5;
BEGIN
  RAISE NOTICE 'The selling price is %', net_price * ( 1 + VAT );
END $$;

-- error when trying to change const value
DO $$
DECLARE
  VAT CONSTANT numeric := 0.1;
  net_price numeric := 20.5;
BEGIN
  RAISE NOTICE 'The selling price is %', net_price * ( 1 + VAT );
  VAT := 0.05;
END $$;

-- PG evaluates value of the const when block is entered at runtime, not compiled time
DO $$
DECLARE
  start_at CONSTANT time := now();
BEGIN
  RAISE NOTICE 'Start executing block at %', start_at;
END $$;