module ApplicationHelper
  def sidebar_link_to(path, icon_name, text)
    link_to path, class: "flex items-center px-4 py-2 text-white hover:bg-gray-700 rounded-md" do
      concat icon('fa-solid', icon_name, class: 'mr-2 text-white')
      concat content_tag(:span, text)
    end
  end
end
