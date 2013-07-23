module ApplicationHelper
  def title(*words)
    unless words.empty?
      content_for :title do
        (words << "Knowledge Base").join(" - ")
      end
    end
  end
end
