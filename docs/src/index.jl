# Main index page for BonitoBook documentation

function index()
    # Features section with Cards
    features = DOM.section(
        DOM.div(

            DOM.h2("Why BonitoBook?", style=Styles(
                "font-size" => "2.5rem",
                "font-weight" => "700",
                "text-align" => "center",
                "margin" => "0 0 3rem 0",
                "color" => "var(--text-primary)"
            )),
            feature_cards(),
            DOM.video(
                src=Asset(asset_path("book-demo.mp4")),
                autoplay=true, loop=true, muted=true,
                style=Styles("width" => "100%", "height" => "auto")
            ),
            style=Styles(
                "max-width" => "1200px",
                "margin" => "0 auto",
                "padding" => "4rem 1rem"
            )
        ),
        style=Styles("background" => "var(--bg-primary)")
    )

    getting_started_path = joinpath(@__DIR__, "..", "examples", "intro.md")
    getting_started = DOM.section(
            BonitoBook.InlineBook(getting_started_path),
        class="section"
    )
    content = DOM.div(features, getting_started)
    return Page(content, "BonitoBook - Interactive Julia Notebooks")
end

function feature_cards()
    features = [
        ("📝", "Live Code Editing", "Edit Julia, Python, and Markdown cells with syntax highlighting, auto-completion, and rich display"),
        ("⚡", "Fast & Interactive", "Built on Bonito framework for real-time reactivity and smooth user experience"),
        ("✨", "AI-Powered", "Built-in AI assistant plugin system, supports Claude Code, but also any model via PromptingTools.jl"),
        ("🎨", "Customizable", "Theme your notebooks with custom CSS and create your own widgets and layouts"),
        ("📤", "Universal Export", "Export to HTML, Quarto, Markdown, IPynb, or PDF for sharing and publishing"),
        ("🔧", "Extensible", "Add custom widgets, create dashboards, or build completely different layouts using the composable ecosystem")
    ]

    feature_items = map(features) do (icon, title, desc)
        Components.Card(
            DOM.div(
                DOM.div(icon, style=Styles(
                    "font-size" => "2.5rem",
                    "margin-bottom" => "1rem",
                    "display" => "block"
                )),
                DOM.h3(title, style=Styles(
                    "margin" => "0 0 0.75rem 0",
                    "font-weight" => "600",
                    "font-size" => "1.25rem",
                    "color" => "var(--text-primary)"
                )),
                DOM.p(desc, style=Styles(
                    "margin" => "0",
                    "color" => "var(--text-secondary)",
                    "line-height" => "1.6"
                )),
                style=Styles("text-align" => "center")
            ),
            style=Styles(
                "flex" => "1 1 300px",
                "margin" => "0",
                "transition" => "transform 0.2s ease, box-shadow 0.2s ease"
            )
        )
    end

    return DOM.div(
        feature_items...,
        style=Styles(
            "display" => "flex",
            "flex-wrap" => "wrap",
            "gap" => "1.5rem",
            "justify-content" => "center"
        )
    )
end
