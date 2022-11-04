-- Return lifecycle states with the DELETED_PENDING bit index (bit 4) set. Other states are unset.
ALTER MODULE lifecycle
ADD FUNCTION set_deleted_pending(p_lifecycle_states SMALLINT) RETURNS SMALLINT
  DETERMINISTIC
  NO EXTERNAL ACTION
  CONTAINS SQL
BEGIN
  RETURN 16;
END@
