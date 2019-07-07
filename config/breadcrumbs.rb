# Root crumb
crumb :root do
  link "メルカリ", root_path
end

# users#index
crumb :users do
  link 'マイページ', user_path(id: current_user.id)
  parent :root
end

# items#show
crumb :item do |item|
  link item.name, item_path(item)
  parent :root
end

# profiles#new
crumb :new_profile do
  link 'プロフィール', new_user_profile_path(user_id: current_user.id)
  parent :users
end

# logouts#show
crumb :logouts do
  link 'ログアウト', user_logouts_path
  parent :users
end

# credits#idex
crumb :credits do
  link '支払い方法', user_credits_path
  parent :users
end

# credits#new
crumb :new_credit do
  link 'クレジットカード情報入力', new_credit_path
  parent :credits
end

# crumb :user do |user|
#   link "@#{user.email}", user_path(user)
#   parent :users
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
