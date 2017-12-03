## 概念理解

- https://github.com/Day8/re-frame/blob/master/docs/API.md

- Coeffect 类似 Ring 的 request map
- Effect 类型 Ring 的 response map
- Interceptors 类型 Ring 的 Middleware

## Event Handler

```
;; for 90%
(reg-event-db
   :my-event
   (fn [db [_ bool]]
       (dispatch [:do-something-else 3])    ;; oops, side-effect
       (assoc db :send-spam new-val)))

;; cofx 输入 fx 输出
(reg-event-fx                             
   :my-event
   (fn [{:keys [db]} [_ a]]               
      {:db  (assoc db :flag true)         
       :dispatch [:do-something-else 3]}))       
```


## Interceptors

```
{:id      :something             ;; decorative only
 :before  (fn [context] ...)     ;; returns possibly modified context
 :after   (fn [context] ...)}    ;; `identity` would be a noop
```
### context

```
{:coeffects {:event [:some-id :some-param]
             :db    <original contents of app-db>}

 :effects   {:db    <new value for app-db>
             :dispatch  [:an-event-id :param1]}

 :queue     <a collection of further interceptors>
 :stack     <a collection of interceptors already walked>}
```

### Handler is also a interceptor

```
(defn db-handler->interceptor
  [db-handler-fn]
  (re-frame.core/->interceptor     ;; a utility function supplied by re-frame
    :id     :db-handler            ;; ids are decorative only
    :before (fn [context]
              (let [{:keys [db event]} (:coeffects context)    ;; extract db and event from coeffects
                    new-db (db-handler-fn db event)]           ;; call the handler
                 (assoc-in context [:effects :db] new-db)))))) ;; put db back into :effects
```

## Effect Handler

```
(reg-fx
  :db
  (fn [value]
    (reset! re-frame.db/app-db value)))
```

内置的 effect handler
- :db
    ```
    {:db  {:key1 value1 :key2 value2}}
    ```
- :dispatch
    ```
    {:dispatch [:event-id "param"] }
    ```
- :dispatch-later
    ```
    {:dispatch-later [{:ms 200 :dispatch [:event-id "param"]}    
                      {:ms 100 :dispatch [:also :this :in :100ms]}]}
    ```
- :dispatch-n
- :deregister-event-handler

## Coeffect Handler

```
(reg-event-fx
    :some-id
    [(inject-cofx :random-int 10) (inject-cofx :now)  (inject-cofx :local-store "blah")]  ;; 3
    (fn [cofx _]
       ... in here I can access cofx's keys :now :local-store and :random-int))

(reg-cofx               ;; registration function
   :now                 ;; what cofx-id are we registering
   (fn [coeffects _]    ;; second parameter not used in this case
      (assoc coeffects :now (js.Date.))))   ;; add :now key, with value


```

## 数据流图
![event-handlers flow](https://github.com/Day8/re-frame/raw/master/images/event-handlers.png?raw=true)
