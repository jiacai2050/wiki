# figwheel

在 Clojure REPL 中启动 figwheel REPL 

1. 配置依赖

  ```clojure
  (defproject repler "0.1.0-SNAPSHOT"
    ...
    :source-paths ["src"] 
    :profiles {:dev {:dependencies [[com.cemerick/piggieback "0.2.1"] <-- Note
                                    [figwheel-sidecar "0.5.8"]]
                     :source-paths ["cljs_src"] }}
    :repl-options {:nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]} <-- Note
    ...
   )
  ```
  
2. 切换 REPL

  ```clojure
  (use 'figwheel-sidecar.repl-api)
  (start-figwheel!) ;; 这里不会 merge profile，如果有必要可以手动设置

  (def figwheel-config
      {:figwheel-options {} ;; <-- figwheel server config goes here 
       :build-ids ["dev"]   ;; <-- a vector of build ids to start autobuilding
       :all-builds          ;; <-- supply your build configs here
         [{:id "dev"
           :figwheel true
           :source-paths ["cljs-src"]
           :compiler {:main "repler.core"
                      :asset-path "js/out"
                      :output-to "resources/public/js/repler.js"
                      :output-dir "resources/public/js/out" }}]})

  (start-figwheel! figwheel-config)

  (cljs-repl)
  ```


参考：https://github.com/bhauman/lein-figwheel/wiki/Using-the-Figwheel-REPL-within-NRepl