# Root crumb
crumb :root do
  link "メルカリ", root_path
end

# users#show
crumb :users do |user|
  link 'マイページ', user_path(user)
  parent :root
end

# items#show
crumb :item do |item|
  link item.name, user_item_path(item)
  parent :root
end

# profiles#new
crumb :new_profile do
  link 'プロフィール', new_user_profiles_path
  parent :users, :new_profile
end

# logouts#show
crumb :logouts do
  link 'ログアウト', user_logouts_path
  parent :users, :logouts
end

# credits#show
crumb :credits do
  link '支払い方法', user_credits_path
  parent :users, :credits
end

# credits#new
crumb :new_credit do
  link 'クレジットカード情報入力', new_user_credits_path
  parent :credits
end

# user_addresses#edit
crumb :user_address do
  link '本人情報の登録', new_user_credits_path
  parent :users, :user_address
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
