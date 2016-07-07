module ItemsHelper

def bidders(item)

item.users.count

end

def user_bidded? (item)
  item.users.where(users: {id: current_user.id}).exists?
end


end
