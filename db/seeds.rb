Worker.destroy_all; Contract.destroy_all; Category.destroy_all; Unit.destroy_all; Post.destroy_all; Relation.destroy_all; Vocation.destroy_all
n = 10
a = ["Иванов","Петров","Смирнов","Кузнецов","Попов","Морозов","Лебедев","Новиков","Алексеев","Орлов"].shuffle
b = ["Николай","Дмитрий","Константин","Ярослав","Павел","Михаил","Евгений","Александр","Петр","Алексей"].shuffle
d = ["Александрович","Евгеньевич","Егорович","Аркадьевич","Робертович","Данилович","Леонидович","Кириллович","Ярославович","Юрьевич"].shuffle
unit=["Отдел управления персоналом","Отдел продаж","Отдел управления персоналом","Отдел продаж","Администрация","Отдел энергетики","Склад","Бухгалтерия","Отдел по развитию производственной системы","Отдел по развитию производственной системы"]
post=["Начальник отдела кадров","Менеджер по продажам","Менеджер отдела кадров","Начальник отдела продаж","Генеральный директор","Энергетик","Начальник склада","Бухгалтер","Директор по развитию","Менеджер по развитию"]
voc=["28","28","28","28","28","36","28","28","28","28"]
for i in 0 ... n
  c = Category.create(name_c: "name_c" + i.to_s, full_name_c: "full_name_c" + i.to_s, d_vocation_c: "vocation_days" + i.to_s)
  s = Post.create(name_p: "name_p" + i.to_s, full_name_p: post[i].to_s, category_id: c.id)
  u = Unit.create(name_u: "name_u" + i.to_s, full_name_u: unit[i].to_s)
  r = Relation.create(d_vocation_pu: voc[i].to_s, post_id: s.id, unit_id: u.id)
  w = Worker.create(l_name: a[i].to_s, f_name: b[i].to_s, s_name: d[i].to_s, inn: "inn12345678" + i.to_s, passport: "passp1234" + i.to_s, snils: "snils12345" + i.to_s, d_bday: Date.today )
  t = Contract.create(number_c: "number" + i.to_s , d_conclusion_c: Date.today, d_expiration_c: Date.today , stavka: "1." + i.to_s  , vocation_c: "vocation_days" + i.to_s  , special_conditions: "spec" + i.to_s, worker_id: w.id, relation_id: r.id)
  v = Vocation.create(type_v: "1" + i.to_s, d_conclusion_v: Date.today-1065.days, d_expiration_v: Date.today-1053.days, is_real: "true", order_date: Date.today, order_number: "order_number " + i.to_s, contract_id: t.id)
  v = Vocation.create(type_v: "1" + i.to_s, d_conclusion_v: Date.today-765.days, d_expiration_v: Date.today-753.days, is_real: "true", order_date: Date.today, order_number: "order_number " + i.to_s, contract_id: t.id)
  v = Vocation.create(type_v: "1" + i.to_s, d_conclusion_v: Date.today-565.days, d_expiration_v: Date.today-553.days, is_real: "true", order_date: Date.today, order_number: "order_number " + i.to_s, contract_id: t.id)
  v = Vocation.create(type_v: "1" + i.to_s, d_conclusion_v: Date.today-365.days, d_expiration_v: Date.today-353.days, is_real: "true", order_date: Date.today, order_number: "order_number " + i.to_s, contract_id: t.id)
  v = Vocation.create(type_v: "1" + i.to_s, d_conclusion_v: Date.today-265.days, d_expiration_v: Date.today-253.days, is_real: "true", order_date: Date.today, order_number: "order_number " + i.to_s, contract_id: t.id)
  v = Vocation.create(type_v: "1" + i.to_s, d_conclusion_v: Date.today-35.days, d_expiration_v: Date.today-27.days, is_real: "true", order_date: Date.today, order_number: "order_number " + i.to_s, contract_id: t.id)
end

if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
  u2.worker=Worker.last
  u2.save
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)
