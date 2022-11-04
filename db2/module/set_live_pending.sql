-- Return lifecycle states with the LIVE_PENDING bit index (bit 2) set. Other states are unset.
ALTER MODULE lifecycle
ADD FUNCTION set_live_pending(p_lifecycle_states SMALLINT) RETURNS SMALLINT
  DETERMINISTIC
  NO EXTERNAL ACTION
  CONTAINS SQL
BEGIN
  RETURN 4;
END@
