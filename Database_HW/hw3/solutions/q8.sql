DROP VIEW IF EXISTS actress;
DROP VIEW IF EXISTS actor;

CREATE VIEW actress AS
SELECT c.title_id, p.person_id, p.name, p.born
FROM public.crew as c
	 JOIN 
	 public.people as p ON c.person_id = p.person_id	
WHERE c.category = 'actress';

CREATE VIEW actor as
SELECT c.title_id, p.person_id, p.name, p.born
FROM public.crew as c
	 JOIN 
	 public.people as p ON c.person_id = p.person_id	
WHERE c.category = 'actor';


SELECT DISTINCT f.born, f.name, m.name
FROM actress AS f
	 JOIN 
	 actor AS m ON f.title_id = m.title_id
AND  f.born = m.born
ORDER BY f.born, f.name, m.name;


