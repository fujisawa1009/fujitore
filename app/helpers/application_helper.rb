module ApplicationHelper
    require "redcarpet"
    require "coderay"
    class HTMLwithCoderay < Redcarpet::Render::HTML
        def block_code(code, language)
            language = language.split(':')[0] if language.present?

            case language.to_s
            when 'rb'
                lang = :ruby
            when 'yml'
                lang = :yaml
            when 'css'
                lang = :css
            when 'html'
                lang = :html
            when ''
                lang = :md
            else
                lang = language
            end

            CodeRay.scan(code, lang).div
        end
    end

    def markdown(text)
        html_render = HTMLwithCoderay.new(
          filter_html: true,
          hard_wrap: true,
          link_attributes: { rel: 'nofollow', target: "_blank" }
        )
        options = {
            autolink: true,
            space_after_headers: true,
            no_intra_emphasis: true,
            fenced_code_blocks: true,
            tables: true,
            hard_wrap: true,
            xhtml: true,
            lax_html_blocks: true,
            strikethrough: true
        }
        markdown = Redcarpet::Markdown.new(html_render, options)
        markdown.render(text)
    end

    def sex(sex)
        if sex == "man"
            return  "男性"
        else
            return "女性"
        end
    end

    def age(age)
        case age
        when 10..14
            return "10代前半"
        when 15..19
            return "10代後半"
        when 20..24
            return "20代前半"
        when 25..29
            return "20代後半"
        when 30..34
            return "30代前半"
        when 35..39
            return "30代後半"
        when 40..44
            return "40代前半"
        when 45..49
            return "40代後半"
        when 50..54
            return "50代前半"
        when 55..59
            return "50代後半"
        when 60..64
            return "60代前半"
        when 65..69
            return "60代後半"
        when 70..74
            return "70代前半"
        when 75..79
            return "70代以上"
    end
end
end