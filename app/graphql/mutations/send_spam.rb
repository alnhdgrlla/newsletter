# module Mutations
#   class SendSpam < BaseMutation
#     argument :template_id, ID, required: false
#     argument :spam_id, ID, required: true
#     argument :spam_name, String, required: false
#     argument :title, String, required: false
#     argument :content, String, required: false
    

#     type Types::TemplateType

#     def resolve(template_id:nil, spam_id:, spam_name: nil, title:nil, content: nil)
      
#       c_u = context[:current_user] 
#       return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

#       temp = Template.find_by(id:template_id) 
#       return GraphQL::ExecutionError.new("No template exists with that ID") if temp.nil?

#       spam = Spam.find_by(id:spam_id)
#       return GraphQL::ExecutionError.new("No spam exists with that ID") if spam.nil?

#       # return GraphQL::ExecutionError.new("You have no right to send the spam") if !spam.temp.manager.id == c_u.id
      
#       if !template_id
#         spam.subscribers.each do |s|
#           send_original(title, spam_name, content, s)
#         end
#       else
#         spam.subscribers.each do |s|
#           send_spam(temp, spam.name, s)
#         end
#       end
      
#       temp
#     end

#     def send_spam(temp, spam_name, s)
#       puts "#{temp[:title]}"
#       puts "To #{s.name}"
#       puts "From #{spam_name}"
#       puts "#{temp[:content]}"
#     end

#     def send_original(title, content, spam_name, s)
#       puts "#{title}"
#       puts "To #{s.name}"
#       puts "From #{spam_name}"
#       puts "#{content}"
#     end
#   end
# end

module Mutations
  class SendSpam < BaseMutation
    argument :template_id, ID, required: false
    argument :spam_id, ID, required: true
    argument :spam_name, String, required: false
    argument :title, String, required: false
    argument :content, String, required: false
    

    type Types::SpamType

    def resolve(template_id:nil, spam_id:, spam_name: nil, title:nil, content: nil)
      
      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      if !template_id

        spam = Spam.find_by(id:spam_id)
        return GraphQL::ExecutionError.new("No spam exists with that ID") if spam.nil?
      
        return GraphQL::ExecutionError.new("You have no right to send the spam") if !spam.manager.id == c_u.id\

        spam.subscribers.each do |s|
          send_original(title, spam_name, content, s)
        end

      else

        temp = Template.find_by(id:template_id) 
        return GraphQL::ExecutionError.new("No template exists with that ID") if temp.nil?

        spam = Spam.find_by(id:spam_id)
        return GraphQL::ExecutionError.new("No spam exists with that ID") if spam.nil?

        return GraphQL::ExecutionError.new("You have no right to send the spam") if !spam.manager.id == c_u.id


        spam.subscribers.each do |s|
          send_spam(temp, spam.name, s)
        end
      end
      
      spam
    end

    def send_spam(temp, spam_name, s)
      puts "#{temp[:title]}"
      puts "To #{s.name}"
      puts "From #{spam_name}"
      puts "#{temp[:content]}"
    end

    def send_original(title, content, spam_name, s)
      puts "#{title}"
      puts "To #{s.name}"
      puts "From #{spam_name}"
      puts "#{content}"
    end
  end
end
