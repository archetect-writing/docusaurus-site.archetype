let context = #{};

context += prompt("Site Title:", "project-title");
context += prompt("Site Tagline:", "project-tagline", #{
    defaults_with: "Dinosaurs are cool",
});

context += prompt("Github Organization/User Name:", "organization-name", #{
    defaults_with: "facebook",
});

context += prompt("Repo/Project Name:", "project-name", #{
  defaults_with: kebab_case(context["project-title"]),
  cases: [
    CasedValue(KebabCase), 
  ], 
});

let lang = prompt("Language:", #{
    type: Select([
        "JavaScript",
        "TypeScript",
     ]),
     answer_key: "lang",
});

context += prompt("Document Root:", "document-root", #{
    defaults_with: "/" + context["project-name"],
    type: Select([
        "/",
        "/" + context["project-name"],
    ]),
});

render(Directory("contents/base"), context);
render(Directory("contents/" + lang), context);
render(Directory("contents/github"), context);
