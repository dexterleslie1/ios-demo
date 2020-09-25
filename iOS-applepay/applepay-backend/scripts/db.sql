create table if not exists applepay_order (
  id bigint primary key auto_increment,
  orderId varchar(64) not null,
  status varchar(16) not null,
  createTime datetime not null
) engine=InnoDB default charset=utf8;

