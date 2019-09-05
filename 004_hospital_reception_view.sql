-- view name: reception_slip
SELECT
  r.reception_id,
  r.reception_timestamp,
  r.terminal_number,
  r.accounting_number,
  d.department_name,
  dc.doctor_name,
  co.consultation_name,
  rd.consultation_time
FROM
  receptions r,
  patients p,
  reception_details rd,
  departments d,
  doctors dc,
  consultations co
WHERE rd.department_id = d.department_id
AND rd.consultation_id = co.consultation_id
AND rd.doctor_id = dc.doctor_id
AND rd.reception_id = r.reception_id
AND r.patient_id = p.patient_id;
