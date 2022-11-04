-- Return lifecycle states with the DELETED bit index (bit 0) set. Other states are preserved.
ALTER MODULE lifecycle
ADD FUNCTION set_deleted(p_lifecycle_states SMALLINT) RETURNS SMALLINT
  DETERMINISTIC
  NO EXTERNAL ACTION
  CONTAINS SQL
BEGIN
  RETURN BITOR(p_lifecycle_states, SMALLINT(1));
END@
