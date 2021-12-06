WITH not_pre_name AS 
    (SELECT p.name
    FROM public.people AS p
         JOIN 
         public.crew AS c ON p.person_id = c.person_id
    WHERE c.title_id IN 
    (
          SELECT c.title_id 
          FROM public.people AS p
               JOIN 
               public.crew AS c ON p.person_id = c.person_id
          WHERE p.name = 'Jennifer Lawrence'
    ))

SELECT tmp.name AS actor_name
FROM not_pre_name AS tmp


EXCEPT

SELECT p.name 
FROM public.people AS p
WHERE p.name IN
(
    'Man-Kwan Shan', 
    'Zheng-Xian Cai',
    'Tzu-Heng Huang'
)

ORDER BY actor_name