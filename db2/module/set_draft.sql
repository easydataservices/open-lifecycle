-- Return lifecycle states with the DRAFT bit index (bit 1) set. Other states are unset.
ALTER MODULE lifecycle
ADD FUNCTION set_draft(p_lifecycle_states SMALLINT) RETURNS SMALLINT
  DETERMINISTIC
  NO EXTERNAL ACTION
  CONTAINS SQL
BEGIN
  RETURN 2;
END@
