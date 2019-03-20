module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = 'Blog App'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  # フラッシュメッセージのアラート変換
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "success"
      when "error"
        "danger"
      when "alert"
        "warning"
      when "notice"
        "primary"
      else
        flash_type.to_s
    end
  end
end
