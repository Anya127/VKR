if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)








Worker.destroy_all; Contract.destroy_all; Category.destroy_all; Unit.destroy_all; Post.destroy_all; Relation.destroy_all; Vocation.destroy_all
n = 10
for i in 0 ... n
  Contract.create(number_c: "number" + i.to_s , d_conclusion_c: Date.today, d_expiration_c: Date.today , stavka: "1." + i.to_s  , vocation_c: "vocation_days" + i.to_s  , special_conditions: "spec" + i.to_s )
  Worker.create(l_name: "l_name" + i.to_s, f_name: "f_name" + i.to_s, s_name: "s_name" + i.to_s, inn: "inn12345678" + i.to_s, passport: "passp1234" + i.to_s, snils: "snils12345" + i.to_s, d_bday: Date.today )
  Category.create(name_c: "name_c" + i.to_s, full_name_c: "full_name_c" + i.to_s, d_vocation_c: "vocation_days" + i.to_s)
  Unit.create(name_u: "name_u" + i.to_s, full_name_u: "full_name_u" + i.to_s)
  Post.create(name_p: "name_p" + i.to_s, full_name_p: "full_name_p" + i.to_s)
  Relation.create(d_vocation_pu: "vocation_days" + i.to_s)
  Vocation.create(type_v: "1" + i.to_s, d_conclusion_v: Date.today, d_expiration_v: Date.today, is_real: "true", order_date: Date.today, order_number: "order_number " + i.to_s)
end
