-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('carcinoma检测', '3', '1', '/system/carcinoma', 'C', '0', 'system:carcinoma:view', '#', 'admin', '2018-03-01', 'ry', '2018-03-01', 'carcinoma检测菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('检测查询', @parentId, '1',  '#',  'F', '0', 'system:carcinoma:list',         '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('检测新增', @parentId, '2',  '#',  'F', '0', 'system:carcinoma:add',          '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('检测修改', @parentId, '3',  '#',  'F', '0', 'system:carcinoma:edit',         '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('检测删除', @parentId, '4',  '#',  'F', '0', 'system:carcinoma:remove',       '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');
