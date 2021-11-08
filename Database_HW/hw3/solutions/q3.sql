SELECT t.premiered,COUNT(*)
FROM public.titles as t
WHERE t.genres LIKE '%Comedy%' AND t.type = 'movie' AND t.premiered IS NOT NULL
GROUP BY t.premiered
ORDER BY t.premiered DESC;