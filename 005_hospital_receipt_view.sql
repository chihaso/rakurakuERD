-- view name: invoice_receipt
SELECT
  b.billing_id,
  b.out_or_in_patient,
  b.issued_date,
  b.accounting_number,
  p.patient_number,
  p.patient_name,
  d.department_name,
  b.billing_start_date,
  b.billing_end_date,
  ic.insurance_category_name,
  ic.self_pay_ratio,
  bic.billing_item_category_name,
  bi.billing_item_name,
  bd.points,
  bd.insurance,
  bd.self_pay,
  b.tax,
  b.note
FROM
  billing b,
  billing_details bd,
  patients p,
  insurance_categories ic,
  terminals t,
  departments d,
  billing_items bi,
  billing_item_categories bic
WHERE bd.billing_id = b.billing_id
AND bd.billing_item_id = bi.billing_item_id
AND b.patient_id = p.patient_id
AND b.department_id = d.department_id
AND b.terminal_id = t.terminal_id
AND bi.billing_item_category_id = bic.billing_item_category_id
AND p.insurance_category_id = ic.insurance_category_id
ORDER BY b.billing_id;


-- view name: total_prices
SELECT
  b.billing_id,
  SUM(bd.insurance) AS total_medical_expences,
  SUM(bd.self_pay)  AS total_self_pay,
  SUM(bd.insurance) + SUM(bd.self_pay) AS total
FROM
  billing b,
  billing_details bd
WHERE bd.billing_id = b.billing_id
GROUP BY b.billing_id
ORDER BY b.billing_id;
