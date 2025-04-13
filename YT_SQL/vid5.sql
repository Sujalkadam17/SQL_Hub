--deriving join 

CREATE TABLE family
(
 child VARCHAR(50),
 parent VARCHAR(50)
);

INSERT INTO family VALUES('Chandragupta',null),
('Bindusara','Chandragupta'),
('Ashok','Bindusara'),
('Mahendra','Ashok');

select * from family;

select c.child , c.parent, p.parent grandparent
from family c  LEFT JOIN family p
on c.parent=p.child;