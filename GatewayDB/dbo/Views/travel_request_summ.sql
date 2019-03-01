
CREATE VIEW [dbo].[travel_request_summ]
AS

/* 
* 11/01/18 mkb: created
*/
SELECT 
	tr.tid,
	tr.trip_no,
	'' as employee_id,
	tr.email,
	tr.out_phone,
	tr.travel_phone,
	tr.reason_code,
	tr.car,
	tr.hotel,
	tr.comments,
	tr.create_date,
	tr.update_date,
	trf1.from_date AS out_from_date,
	trf1.from_iata AS out_from_iata,
	trf1.from_city AS out_from_city,
	trf1.from_state AS out_from_state,
	trf1.from_country AS out_from_country,
	trf1.arrival_time AS out_arrival_time,
	trf1.arrival_meridiem AS out_arrival_meridiem,
	trf1.to_date AS out_to_date,
	trf1.to_iata AS out_to_iata,
	trf1.to_city AS out_to_city,
	trf1.to_state AS out_to_state,
	trf1.to_country AS out_to_country,
	trf2.from_date AS in_from_date,
	trf2.from_iata AS in_from_iata,
	trf2.from_city AS in_from_city,
	trf2.from_state AS in_from_state,
	trf2.from_country AS in_from_country,
	trf2.arrival_time AS in_arrival_time,
	trf2.arrival_meridiem AS in_arrival_meridiem,
	trf2.to_date AS in_to_date,
	trf2.to_iata AS in_to_iata,
	trf2.to_city AS in_to_city,
	trf2.to_state AS in_to_state,
	trf2.to_country AS in_to_country
	
FROM travel_request tr
	LEFT JOIN travel_request_info trf1
		ON tr.id = trf1.travel_request_id
		AND trf1.travel_type= 'OUT'
	LEFT JOIN travel_request_info trf2
		ON tr.id = trf2.travel_request_id
		AND trf2.travel_type = 'IN'
		

