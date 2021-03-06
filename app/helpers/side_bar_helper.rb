module SideBarHelper
  def side_bar_items(ru)
    result = []
    if ru.nil?
      result << {:name => 'Календарь',
        :controller => :calendars, :action => :index,
        :icon => 'calendar'}
      else
   if ru.is_admin?
      result << {
       :name => 'Администрирование',
       :icon => 'paperclip ',
       :children => [
       {:name => 'Пользователи',
        :controller => :users, :action => :index,
        :icon => 'address-book-o',
        :class => 'long'}
      ]}
      result << {
        :name => 'Сотрудники',
        :icon => 'address-card',
        :children => [
       {:name => 'Все сотрудники', :controller => :workers,
        :action => :index,  :icon => 'vcard-o',
        :class => 'long' },
       {:name => 'Добавление сотрудника', :controller => :workers,
        :action => :new, :icon => 'user-plus'}
      ]}
      result << {
        :name => 'Данные',
        :icon => 'list',
        :children => [
       {:name => 'Договоры', :controller => :contracts,
        :action => :index,  :icon => 'file-text-o'},
       {:name => 'Добавление договора', :controller => :contracts,
        :action => :new, :icon => 'edit'},
       {:name => 'Категории', :controller => :categories,
        :action => :index, :icon => 'list-alt '},
       {:name => 'Подразделения', :controller => :units,
        :action => :index, :icon => 'sitemap'},
      ]}
      result << {
        :name => 'Планирование',
        :icon => 'check-square',
        :children => [
       {:name => 'Календарь', :controller => :calendars,
        :action => :index,  :icon => 'calendar-o', params: {year: Date.today().year}},
       {:name => 'Выбор отпуска', :controller => :calendars,
        :action => :index_for_user,  :icon => 'calendar-plus-o', params: {year: Date.today().year}}
     ]}
   elsif ru.is_operator?
        result << {
          :name => 'Сотрудники',
          :icon => 'address-card',
          :children => [
         {:name => 'Все сотрудники', :controller => :workers,
          :action => :index,  :icon => 'vcard-o',
          :class => 'long' },
         {:name => 'Добавление сотрудника', :controller => :workers,
          :action => :new, :icon => 'user-plus'}
        ]}
        result << {
          :name => 'Данные',
          :icon => 'list',
          :children => [
         {:name => 'Договоры', :controller => :contracts,
          :action => :index,  :icon => 'file-text-o'},
         {:name => 'Добавление договора', :controller => :contracts,
          :action => :new, :icon => 'edit'},
         {:name => 'Категории', :controller => :categories,
          :action => :index, :icon => 'list-alt '},
         {:name => 'Подразделения', :controller => :units,
          :action => :index, :icon => 'sitemap'},
        ]}
        result << {
          :name => 'Утверждение',
          :icon => 'check-square',
          :children => [
         {:name => 'Календарь', :controller => :calendars,
          :action => :index,  :icon => 'calendar-o', params: {year: Date.today().year}},
         {:name => 'Утверждение отпусков', :controller => :calendars,
          :action => :index_for_operator,  :icon => 'calendar-plus-o', params: {year: Date.today().year}}
       ]}
     else
       result << {
         :name => 'Сотрудники',
         :icon => 'address-card',
         :children => [
        {:name => 'Все сотрудники', :controller => :workers,
         :action => :index,  :icon => 'vcard-o',
         :class => 'long' }
       ]}
       result << {
         :name => 'Планирование',
         :icon => 'check-square',
         :children => [
        {:name => 'Календарь', :controller => :calendars,
         :action => :index,  :icon => 'calendar-o', params: {year: Date.today().year}},
        {:name => 'Выбор отпуска', :controller => :calendars,
         :action => :index_for_user,  :icon => 'calendar-plus-o', params: {year: Date.today().year}},
        {:name => 'Предыдущие года', :controller => :calendars,
         :action => :index,  :icon => 'calendar-check-o', params: {year: Date.today().year}}
      ]}
    end
  end
  result
end
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users','admin','operator'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
