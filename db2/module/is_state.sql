-- Return TRUE if lifecycle states contain specified state code set, FALSE if unset; NULL if the code is invalid.
ALTER MODULE lifecycle
ADD FUNCTION is_state(p_lifecycle_states SMALLINT, p_state_code VARCHAR(20)) RETURNS BOOLEAN
  DETERMINISTIC
  NO EXTERNAL ACTION
  CONTAINS SQL
BEGIN
  DECLARE v_states SMALLINT;
  SET v_states =
    CASE p_state_code
      WHEN 'DELETED' THEN BITAND(p_lifecycle_states, 1)
      WHEN 'DRAFT' THEN BITAND(p_lifecycle_states, 2)
      WHEN 'LIVE_PENDING' THEN BITAND(p_lifecycle_states, 4)
      WHEN 'LIVE' THEN BITAND(p_lifecycle_states, 8)
      WHEN 'DELETED_PENDING' THEN BITAND(p_lifecycle_states, 16)
    END;
  IF v_states = 0 THEN
    RETURN FALSE;
  ELSEIF v_states > 0 THEN
    RETURN TRUE;
  ELSE
    RETURN NULL;
  END IF;
END@
