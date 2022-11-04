-- Return lifecycle states with the LIVE bit index (bit 3) set. Other states are unset.
ALTER MODULE lifecycle
ADD FUNCTION set_live(p_lifecycle_states SMALLINT) RETURNS SMALLINT
  DETERMINISTIC
  NO EXTERNAL ACTION
  CONTAINS SQL
BEGIN
  RETURN 8;
END@
