SELECT A.ID, B.AGE, A.COINS_NEEDED, A.POWER
FROM WANDS A
    JOIN WANDS_PROPERTY B
    ON A.CODE = B.CODE
    WHERE B.IS_EVIL = 0
    AND A.COINS_NEEDED = (SELECT MIN(A1.COINS_NEEDED)
                            FROM WANDS A1
                            JOIN WANDS_PROPERTY B1
                            ON A1.CODE = B1.CODE
                            WHERE B.AGE = B1.AGE
                            AND A.POWER = A1.POWER)
ORDER BY A.POWER DESC, B.AGE DESC;

