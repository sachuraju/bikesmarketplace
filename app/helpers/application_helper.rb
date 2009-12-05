# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def def drop_down_items
    ['Bikes'].sort.collect{|element| [element.singularize.titleize, element]}
  end
end
