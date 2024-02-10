module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'インクコレクション'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      title: 'インクコレクション',
      reverse: true,
      charset: 'utf-8',
      description: '万年筆とインクを簡単管理！',
      keywords: '万年筆,インク,管理',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@claruslapis',
        image: image_url('ogp.png')
      }
    }
  end
end
