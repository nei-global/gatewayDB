

CREATE view [dbo].[ee_cono]
As

/* 
* 11/02/18 mkb: created
*/
SELECT
	tid,
	LEFT(tid,CHARINDEX('-',tid)-1) AS cono

FROM ee_profile

